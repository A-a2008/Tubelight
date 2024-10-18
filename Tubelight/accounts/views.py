from django.shortcuts import render, redirect
import os
import csv
import hashlib

# Create your views here.

def hash_password(password, salt):
    hashed_password = hashlib.sha256((password + salt).encode('utf-8')).hexdigest()
    return hashed_password

def check_password(password, hashed_password, salt):
    computed_hashed_password = hash_password(password, salt)
    return computed_hashed_password == hashed_password


def register(request):
    if request.method == 'POST':
        first_name = request.POST['first_name']
        last_name = request.POST['last_name']
        username = request.POST['username']
        email = request.POST['email']
        password1 = request.POST['password1']
        password2 = request.POST['password2']

        users = "./database/users.csv"

        with open(users, mode='r', newline='') as file:
            reader = csv.DictReader(file)

            for row in reader:
                if row['username'] == username:
                    data = {
                        "messages": ["Username already exists"],
                    }
                    return render(request, 'accounts/register.html', data)

        with open(users, mode='a', newline='') as file:
            writer = csv.writer(file)

            if password1 == password2:
                password_hash = hash_password(password1, username)
                writer.writerow([first_name, last_name, username, email, password_hash])
                request.session["is_authenticated"] = True
                request.session["username"] = username
                request.session["first_name"] = first_name
                request.session["last_name"] = last_name
                request.session["email"] = email

                return redirect('home')
    else:
        return render(request, 'accounts/register.html')
