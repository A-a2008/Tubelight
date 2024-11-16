from django.urls import path
from . import views

urlpatterns = [
    path("", views.home, name="home"),
    path("base/", views.base, name="base"),
    path("tubes/", views.display_events, name="display_events"),
    path("tubes/create/", views.create_event, name="create_event"),
    path("tubes/connections/<int:event_id>/", views.display_subevents, name="display_subevents"),
    path("tubes/connections/create/<int:event_id>/", views.create_subevent, name="create_subevent"),
    path("tubes/connections/details/<int:subevent_id>/", views.display_subevent_details, name="display_subevent_details"),
    path("tubes/invitation/<int:event_id>/", views.event_invitation, name="event_invitation"),
    path("tubes/download_files/<int:event_id>/", views.download_files, name="download_files"),
]