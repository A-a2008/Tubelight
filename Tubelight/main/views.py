from django.shortcuts import render, redirect
import csv

# Create your views here.

def home(request):
    if "is_authenticated" not in request.session:
        request.session["is_authenticated"] = False
    return render(request, "index.html")


def base(request):
    return render(request, "base.html")


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

        events_file_id = None
        events_file = "./database/events.csv"
        with open(events_file, "r", newline="") as f:
            reader = list(csv.DictReader(f))

            last_row = reader[-1]
            events_file_id = int(last_row["id"]) + 1
        print(events_file_id)
        with open(events_file, "a", newline="") as f:
            writer = csv.writer(f)
            writer.writerow([events_file_id, name, "B", "2021-09-10", "10:00:00", "Venue A", "A", "Students"])
        
        return redirect("display_events")
    else:
        return render(request, "main/create_event.html")