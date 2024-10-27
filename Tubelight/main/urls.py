from django.urls import path
from . import views

urlpatterns = [
    path("", views.home, name="home"),
    path("base/", views.base, name="base"),
    path("tubes/", views.display_events, name="display_events"),
    path("tubes/create/", views.create_event, name="create_event"),
    path("tubes/connections/<int:event_id>/", views.display_subevents, name="display_subevents"),
    path("tubes/connections/create/<int:event_id>/", views.create_subevent, name="create_subevent"),
]