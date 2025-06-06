from django.shortcuts import render, redirect
import os
import csv
import hashlib
from mysql_connection import add_row, get_table, update_value

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

        reader = get_table("users")

        for row in reader:
            if row['username'] == username:
                data = {
                    "messages": ["Username already exists"],
                }
                return render(request, 'accounts/register.html', data)

        if password1 == password2:
            password_hash = hash_password(password1, username)
            # writer.writerow([first_name, last_name, username, email, password_hash, ""])
            add_row("users", first_name, last_name, username, email, password_hash, "")
            request.session["is_authenticated"] = True
            request.session["username"] = username
            request.session["first_name"] = first_name
            request.session["last_name"] = last_name
            request.session["email"] = email

            return redirect('home')
        else:
            data = {
                "messages": ["Passwords do not match"],
            }
            return render(request, 'accounts/register.html', data)
    else:
        return render(request, 'accounts/register.html')


def login(request):
    if request.method=='POST':
        username = request.POST['username']
        password = request.POST['password']

        reader = get_table("users")
        
        for row in reader:
            if row['username'] == username:
                if check_password(password,row['password'],row['username']):
                    request.session["is_authenticated"] = True
                    request.session['username'] = username
                    request.session['first_name'] = row['first_name']
                    request.session['last_name'] = row['last_name']
                    request.session['email'] = row['email']
                    return redirect('home')
                else:
                    data={
                        'messages':["Incorrect password"]
                    }
                    return render(request,'accounts/login.html',data)
        else:
            data={
                'messages':["Username not found"]
            }
            return render(request,'accounts/login.html',data)
    else:
        return render(request, 'accounts/login.html' )
    

def logout(request):
    request.session["is_authenticated"] = False
    del request.session['first_name']
    del request.session['last_name']
    del request.session['username']
    del request.session['email']
    return redirect('home')
