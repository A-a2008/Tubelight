from django.shortcuts import render, redirect
import csv
import os

# Create your views here.

def home(request):
    if "is_authenticated" not in request.session:
        request.session["is_authenticated"] = False
    return render(request, "index.html")


def base(request):
    return render(request, "base.html")


def get_event_event_id(events_file, event_id):
    with open(events_file, "r", newline="") as f:    
        reader = csv.DictReader(f)
        for row in reader:
            if int(row["id"]) == event_id:
                return row
    return None


def get_subevents_event_id(subevents_file, event_id):
    subevents = []
    with open(subevents_file, "r", newline="") as f:    
        reader = csv.DictReader(f)
        for row in reader:
            if int(row["event_id"]) == event_id:
                subevents.append(row)
    return subevents


def get_subevent_subevent_id(subevents_file, subevent_id):
    with open(subevents_file, "r", newline="") as f:    
        reader = csv.DictReader(f)
        for row in reader:
            if int(row["id"]) == subevent_id:
                return row
    return None


def get_files_subevent_id(files_file, subevent_id):
    files = []
    with open(files_file, "r", newline="") as f:    
        reader = csv.DictReader(f)
        for row in reader:
            if int(row["subevent_id"]) == subevent_id:
                files.append(row)
    return files


def display_events(request):
    if request.session["is_authenticated"] == True:
        events = []
        users_file = "./database/users.csv"

        with open(users_file, "r", newline="") as f:
            reader = csv.DictReader(f)

            for row in reader:
                if row["username"] == request.session["username"]:
                    events_id = row["events"].split("|")[:-1]
        
        events_file = "./database/events.csv"

        with open(events_file, "r", newline="") as f:
            reader = csv.DictReader(f)

            for row in reader:
                if row["id"] in events_id:
                    events.append(row)
        
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

        events_file_id = None
        events_file = "./database/events.csv"
        with open(events_file, "r", newline="") as f:
            reader = list(csv.DictReader(f))
            if len(reader):
                last_row = reader[-1]
                events_file_id = int(last_row["id"]) + 1
            else:
                events_file_id = 0

        print(events_file_id)
        with open(events_file, "a", newline="") as f:
            writer = csv.writer(f)
            writer.writerow([events_file_id, name, description, date, time, venue, cheif_guest, target_audience])

        users_file = "./database/users.csv"
        with open(users_file, "r", newline="") as f:
            reader = csv.DictReader(f)
            users_file_rows = list(reader)
            for row in users_file_rows:
                if row["username"] == username:
                    row["events"] += str(events_file_id) + "|"
                    break
        
        with open(users_file, "w", newline="") as f:
            cols = users_file_rows[0].keys()
            writer = csv.DictWriter(f, fieldnames=cols)
            writer.writeheader()
            writer.writerows(users_file_rows)

        return redirect("display_events")
    else:
        return render(request, "main/create_event.html")
    

def display_subevents(request, event_id):
    subevents = []

    events_file = "./database/events.csv"
    subevents_file = "./database/subevents.csv"

    event = get_event_event_id(events_file, event_id)

    with open(subevents_file, "r", newline="") as f:
        reader = csv.DictReader(f)
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
        subevents_file = "./database/subevents.csv"
        with open(subevents_file, "r", newline="") as f:
            reader = list(csv.DictReader(f))
            if len(reader):
                last_row = reader[-1]
                subevents_file_id = int(last_row["id"]) + 1
            else:
                subevents_file_id = 0

        with open(subevents_file, "a", newline="") as f:
            writer = csv.writer(f)
            writer.writerow([subevents_file_id, event_id, name, description, duration])

        return redirect("create_subevent", event_id=event_id)
    else:
        events_file = "./database/events.csv"
        subevents_file = "./database/subevents.csv"
        data = {
            "event": get_event_event_id(events_file, event_id),
            "subevents": get_subevents_event_id(subevents_file, event_id),
        }

        return render(request, "main/create_subevent.html", data)
    

def display_subevent_details(request, subevent_id):
    if request.method == "POST":
        file_name = request.POST["file_name"]
        uploaded_file = request.FILES.get('file')
        file_name = f"{file_name}{os.path.splitext(uploaded_file.name)[1]}"

        if uploaded_file:
            files_file = "./database/files.csv"
            files_dir = "./database/files"
            save_path = os.path.join(files_dir, file_name)
            
            os.makedirs(os.path.dirname(save_path), exist_ok=True)
            
            with open(save_path, 'wb') as file:
                for chunk in uploaded_file.chunks():
                    file.write(chunk)
            
            files_file_id = order = None
            with open(files_file, "r", newline="") as f:
                reader = list(csv.DictReader(f))
                if len(reader):
                    last_row = reader[-1]
                    files_file_id = int(last_row["id"]) + 1
                    order = int(last_row["order"]) + 1
                else:
                    files_file_id = 0
                    order = 1
            
            with open(files_file, "a", newline="") as f:
                writer = csv.writer(f)
                writer.writerow([files_file_id, subevent_id, order, save_path, file_name])

        return redirect("display_subevent_details", subevent_id=subevent_id)
    else:
        subevents_file = "./database/subevents.csv"
        files_file = "./database/files.csv"

        data = {
            "subevent": get_subevent_subevent_id(subevents_file, subevent_id),
            "files": get_files_subevent_id(files_file, subevent_id),
        }

        return render(request, "main/display_subevent_details.html", data)