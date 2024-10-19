from django.shortcuts import render, redirect

# Create your views here.

def home(request):
    
    if "is_authenticated" not in request.session:
        request.session["is_authenticated"] = False
    return render(request, "index.html")

def base(request):
    return render(request, "base.html")

def test1(request):
    if request.method == "POST":
        name = request.POST["name2"]
        print(name)

        return redirect("/")
    else:
        names = {"Aryan": 1, "Sriman": 2, "ABCD": 3}
        data = {
            "names": names,
        }
        return render(request, "test1.html", data)
