from django.shortcuts import render, redirect
from django.template.loader import render_to_string
from django.http import HttpResponse
import csv
import os
from datetime import datetime
import tempfile
# from weasyprint import HTML, CSS
import qrcode
from PIL import Image
import zipfile
from mysql_connection import add_row, add_row_dict, get_table, update_value, create_table, create_table_foreign_key, fetch_columns, drop_table, datatypes

# Create your views here.

def home(request):
    if "is_authenticated" not in request.session:
        request.session["is_authenticated"] = False
    return render(request, "index.html")


def base(request):
    return render(request, "base.html")


def get_event_event_id(event_id):
    reader = get_table("events")
    for row in reader:
        if int(row["id"]) == event_id:
            return row
    return None


def get_subevents_event_id(event_id):
    subevents = []  
    reader = get_table("subevents")
    for row in reader:
        if int(row["event_id"]) == event_id:
            subevents.append(row)
    return subevents


def get_subevent_subevent_id(subevent_id):
    reader = get_table("subevents")
    for row in reader:
        if int(row["id"]) == subevent_id:
            return row
    return None


def get_files_subevent_id(subevent_id):
    files = [] 
    reader = get_table("files")
    for row in reader:
        if int(row["subevent_id"]) == subevent_id:
            files.append(row)
    return files

def get_files_event_id(event_id):
    subevents = get_subevents_event_id(event_id)
    files = {}
    for subevent in subevents:
        subevent_id = int(subevent["id"])
        subevent_files = []   
        reader = get_table("files")
        for row in reader:
            if int(row["subevent_id"]) == subevent_id:
                subevent_files.append(row["path"])
        files[subevent["name"]] = subevent_files
    return files


def venue_qr(url, save_path, qr_size=300):
    qr = qrcode.QRCode(
        version=1,
        error_correction=qrcode.constants.ERROR_CORRECT_H,
        box_size=10,
        border=4,
    )
    qr.add_data(url)
    qr.make(fit=True)

    qr_img = qr.make_image(fill="black", back_color="white").convert("RGB")

    qr_img = qr_img.resize((qr_size, qr_size), Image.LANCZOS)

    qr_img.save(save_path)


def display_events(request):
    if request.session["is_authenticated"] == True:
        events = []
        reader = get_table("users")

        for template in reader:
            if template["username"] == request.session["username"]:
                event_ids = [(int(event.split("-")[0]), int(event.split("-")[1])) for event in template["events"].split("|")[:-1]]
                events_id = template["events"].split("|")[:-1]
        
        reader = get_table("templates")
        for event in event_ids:
            for template in reader:
                if template["id"] == event[0]:
                    template_events = get_table(template["name"])
                    for template_event in template_events:
                        if template_event["id"] == event[1]:
                            template_event["template_name"] = template["name"]
                            events.append(template_event)

        print(events)
        
        data = {
            "events": events,
        }

        return render(request, "main/display_events.html", data)
    else:
        data = {
            "messages": ["You aren't logged in to create a tube. Please sign in"]
        }
        return render(request, "accounts/login.html", data)


def create_event(request):
    if request.method == "POST":
        username = request.POST["username"]
        name = request.POST["name"]
        description = request.POST["description"]
        date = request.POST["date"]
        time = request.POST["time"]
        venue = request.POST["venue"]
        cheif_guest = request.POST["cheif_guest"]
        target_audience = request.POST["target_audience"]

        today = datetime.now().strftime("%Y-%m-%d")
        data = datetime.strptime(date, "%Y-%m-%d")
        if date < today:
            data = {
                "messages": ["Invalid date. Please select a date from today onwards"]
            }
            return render(request, "main/create_event.html", data)

        events_file_id = None
        reader = get_table("events")
        if len(reader):
            last_row = reader[-1]
            events_file_id = int(last_row["id"]) + 1
        else:
            events_file_id = 0

        print(events_file_id)
        add_row("events", events_file_id, name, description, date, time, venue, cheif_guest, target_audience)

        new_user_events = ""
        users_file_rows = get_table("users")
        for row in users_file_rows:
            if row["username"] == username:
                new_user_events = str(events_file_id) + "|"
                break
        update_value(table_name="users", column="events", value=new_user_events, identifier_name="username", identifier_value=username)

        venue_qr(venue, f"./static/images/venues/{events_file_id}.png")

        return redirect("display_events")
    else:
        return render(request, "main/create_event.html")
    

def display_subevents(request, event_id):
    subevents = []

    event = get_event_event_id(event_id)

    reader = get_table("subevents")
    for row in reader:
        if int(row["event_id"]) == event_id:
            subevents.append(row)
    
    data = {
        "event": event,
        "subevents": subevents,
    }

    return render(request, "main/display_subevents.html", data)


def create_subevent(request, event_id):
    if request.method == "POST":
        name = request.POST["name"]
        description = request.POST["description"]
        duration = request.POST["duration"]

        subevents_file_id = None
        reader = get_table("subevents")
        if len(reader):
            last_row = reader[-1]
            subevents_file_id = int(last_row["id"]) + 1
        else:
            subevents_file_id = 0

        add_row("subevents", subevents_file_id, event_id, name, description, duration)

        return redirect("create_subevent", event_id=event_id)
    else:
        data = {
            "event": get_event_event_id(event_id),
            "subevents": get_subevents_event_id(event_id),
        }

        return render(request, "main/create_subevent.html", data)
    

def display_subevent_details(request, subevent_id):
    reader = get_table("events")
    for row in reader:
        if int(row["id"]) == subevent_id:
            event = row
            break

    if request.method == "POST":
        file_name = request.POST["file_name"]
        uploaded_file = request.FILES.get('file')
        file_name = f"{event['id']}-{file_name}{os.path.splitext(uploaded_file.name)[1]}"

        if uploaded_file:
            files_dir = "./database/files"
            save_path = f"{files_dir}/{file_name}"
            
            os.makedirs(os.path.dirname(save_path), exist_ok=True)
            
            with open(save_path, 'wb') as file:
                for chunk in uploaded_file.chunks():
                    file.write(chunk)
            
            files_file_id = order = None
            reader = get_table("files")
            if len(reader):
                last_row = reader[-1]
                files_file_id = int(last_row["id"]) + 1
                order = int(last_row["subevent_order"]) + 1
            else:
                files_file_id = 0
                order = 1

            add_row("files", files_file_id, subevent_id, order, save_path, file_name)

        return redirect("display_subevent_details", subevent_id=subevent_id)
    else:
        data = {
            "subevent": get_subevent_subevent_id(subevent_id),
            "files": get_files_subevent_id(subevent_id),
        }

        return render(request, "main/display_subevent_details.html", data)
    

# def event_invitation(request, event_id):
#     events_file = "./database/events.csv"
#     event = get_event_event_id(events_file, event_id)
#     event["date"] = datetime.strptime(event["date"], "%Y-%m-%d").strftime("%d-%m-%Y")
#     event["time"] = datetime.strptime(event["time"], "%H:%M").strftime("%I:%M %p")

#     data = {
#         "event": event,
#     }

#     invitation_html = render_to_string("main/event_invitation.html", data)

#     css_url = request.build_absolute_uri('/static/assets/css/main.css')

#     custom_css = """
#         @page {
#             size: A2;
#             margin: 0cm;
#         }
#     """

#     with tempfile.NamedTemporaryFile(delete=True) as invitation_file:
#         HTML(string=invitation_html, base_url=request.build_absolute_uri()).write_pdf(
#             invitation_file.name,
#             stylesheets=[CSS(css_url), CSS(string=custom_css)]
#         )

#         response = HttpResponse(open(invitation_file.name, 'rb'), content_type='application/pdf')
#         response['Content-Disposition'] = f'attachment; filename="{event["name"]}_invitation.pdf"'
#         return response
    
def download_files(request, event_id):
    files = get_files_event_id(event_id)

    event = get_event_event_id(event_id)

    download_zip = audio_files_edit(files, event["name"])
    original_file_name = os.path.basename(download_zip)

    with open(download_zip, 'rb') as zip_file:
        response = HttpResponse(zip_file.read(), content_type='application/zip')
        response['Content-Disposition'] = f'attachment; filename="{original_file_name}"'
        return response


def audio_files_edit(file_paths, event_name):
    current_date = datetime.now().strftime("%Y-%m-%d")

    zip_file_name = f'{event_name}-{current_date}.zip'
    zip_files = "./database/files/zip_files"
    zip_file_path = os.path.join(zip_files, zip_file_name)
    zip_file_url = os.path.join(zip_files, zip_file_name)

    print(file_paths)
    with zipfile.ZipFile(zip_file_path, 'w') as zip_file:
        for subevent_name, all_file_paths in file_paths.items():
            for file_path in all_file_paths:
                file_path = os.path.abspath(file_path)
                print(file_path)
                file_name = os.path.basename(file_path)
                zip_file.write(file_path, arcname=os.path.join(subevent_name, file_name))
                if file_path.endswith('.mp3'):
                    zip_file.write(file_path, arcname=os.path.join("All Music Files", file_name))
                    
    return zip_file_url


# Templates


service_options = {
    "Food Caterers": "caterers",
    "Photographer": "photographers",
    "Photographer + Videographers": "photographer_videographers",
    "Decorators": "decorators",
    "DJ": "dj",
    "Sound System": "sound_system",
    "Musicians": "musicians",
    "Venue Lighting and Sound": "lighting_sound",
    "Event Coordinator": "event_coordinator",
    "Valet": "valet",
    "Waiters": "waiters",
    "Bouncers": "bouncers",
    "Screen": "screen",
    "Other": "other"
}


def templates_menu(request):
    return render(request, "main/templates_menu.html")


def create_template(request):
    if request.method == "POST":
        name = request.POST["name"]
        description = request.POST["description"]

        templates = get_table("templates")
        for row in templates:
            if row["name"] == name:
                data = {
                    "messages": ["Template with this name already exists. Please choose a different name"]
                }
                return render(request, "main/create_template.html", data)

        fields = {"id": "foriegn_key_parent"}
        raw = ""
        for key in request.POST:
            if key.startswith("field_name"):
                field_name = request.POST[key]
                num = key.split("_")[-1]
                if request.POST[f"field_type_{num}"] == "select":
                    options = []
                    for key_ in request.POST:
                        if key_.startswith(f"field_type_{num}_option_"):
                            options.append(request.POST[key_])
                    raw += f"{field_name}:select-{options}|"
                    fields[field_name] = "select"
                else:
                    raw += f"{field_name}:{request.POST[f'field_type_{num}']}|"
                    fields[field_name] = request.POST[f"field_type_{num}"]
        
        raw = raw[:-1]

        create_table(name, fields)
        subevents = ""
        for key in request.POST:
            if key.startswith("subevent_name_"):
                subevents += f"{request.POST[key]}|"
        subevents = subevents[:-1]

        templates_id = None
        reader = get_table("templates")
        if len(reader):
            last_row = reader[-1]
            templates_id = int(last_row["id"]) + 1
        else:
            templates_id = 0
        
        add_row("templates", templates_id, name, description, raw, subevents)
        return redirect("show_templates")
    else:
        return render(request, "main/create_template.html")
    

def show_templates(request):
    if request.method == "POST":
        pass
    else:
        templates = get_table("templates")
        data = {
            "templates": templates,
        }
        return render(request, "main/show_templates.html", data)


def create_tube_template(request, template_id):
    if request.method == 'POST':
        print(request.POST)
        username = request.POST["username"]
        data = get_table("templates")
        for row in data:
            if int(row["id"]) == template_id:
                template = row
                break

        tube_id = None
        reader = get_table(template["name"])
        if len(reader):
            last_row = reader[-1]
            tube_id = int(last_row["id"]) + 1
        else:
            tube_id = 0
        
        fields = [field.split(":")[0] for field in template["raw"].split("|")]
        row_data = {"id": tube_id}
        for key, value in request.POST.items():
            if key.startswith("field"):
                column = key.split("|")[1]
                row_data[column] = value
        
        add_row_dict(template["name"], row_data)

        new_user_events = ""
        users_file_rows = get_table("users")
        for row in users_file_rows:
            if row["username"] == username:
                new_user_events = f"{template['id']}-{tube_id}" + "|"
                break
        update_value(table_name="users", column="events", value=new_user_events, identifier_name="username", identifier_value=username)

        return redirect("select_template")
    else:
        data = get_table("templates")
        for row in data:
            if int(row["id"]) == template_id:
                template = row
                break
        
        fields = [[field.split(":")[0], [field.split(":")[1]]] for field in template["raw"].split("|")]
        for field in fields:
            if field[1][0].startswith("select"):
                options = eval(field[1].split("-")[1])
                field[1] = ["select", options]
        
        data = {
            "fields": fields,
            "template": template,
        }
        return render(request, "main/create_tube_template.html", data)


def edit_subevents(request, template_id):
    if request.method == "POST":
        print(request.POST)
        data = get_table("templates")
        for row in data:
            if row["id"] == template_id:
                template = row
                break
        table_name = f"{template['name']}_details"
        columns = [x for x in template["subevents"].split("|")]
        print(columns)
        column_dict = {"id": "id", f"{template['name']}_id": "foriegn_key"}
        for column in columns:
            if column in request.POST:
                for service in request.POST.getlist(column):
                    column_dict[f"{column}|{service}"] = "select"
        return_code = create_table_foreign_key(table_name, column_dict, template["name"], "id", f"{template['name']}_id")
        if return_code == -1:
            drop_table(table_name)
            create_table_foreign_key(table_name, column_dict, template["name"], "id", f"{template['name']}_id")
        return redirect("templates_menu")
    else:
        data = get_table("templates")
        for row in data:
            if int(row["id"]) == template_id:
                template = row
                break
        
        subevents = template["subevents"].split("|")
        subevent_dict = dict()
        print(f"{template['name']}_details")
        template_details_columns = fetch_columns(f"{template['name']}_details")
        print(template_details_columns)
        if not template_details_columns == -1:
            template_details_columns = template_details_columns[2:]
            for column in template_details_columns:
                subevent, service = tuple(column.split("|"))
                if subevent in subevent_dict:
                    subevent_dict[subevent].append(service)
                else:
                    subevent_dict[subevent] = [service]
        for subevent in subevents:
            subevent_dict.setdefault(subevent, [])
        print(subevent_dict)
        print(subevents)

        data = {
            "template": template,
            "subevents": subevent_dict,
            "service_options": service_options,
        }
        return render(request, "main/edit_subevents.html", data)
