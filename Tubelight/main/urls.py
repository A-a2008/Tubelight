from django.urls import path
from . import views

urlpatterns = [
    path("", views.home, name="home"),
    path("base/", views.test1, name="base"),
    path("test1form/", views.test1, name="base"),
]