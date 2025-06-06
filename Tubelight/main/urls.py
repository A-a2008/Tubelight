from django.urls import path
from . import views

urlpatterns = [
    path("", views.home, name="home"),
    path("base/", views.base, name="base"),
    path("tubes/", views.display_tubes, name="display_events"),
    path("tubes/create/", views.create_event, name="create_event"),
    path("tubes/create/select_template/", views.show_templates, name="select_template"),
    path("tubes/create/use_template/<int:template_id>/", views.create_tube_template, name="create_tube_template"),
    path("tubes/connections/<int:event_id>/", views.display_subevents, name="display_subevents"),
    path("tubes/connections/create/<int:event_id>/", views.create_subevent, name="create_subevent"),
    path("tubes/connections/details/<int:subevent_id>/", views.display_subevent_details, name="display_subevent_details"),
    path("tubes/invitation/<int:template_id>/<int:event_id>/", views.event_invitation_template, name="event_invitation_template"),
    path("tubes/download_files/<int:event_id>/", views.download_files, name="download_files"),
    path("templates/", views.templates_menu, name="templates_menu"),
    path("templates/create_template/", views.create_template, name="create_template"),
    path("templates/event_details/<int:template_id>/<int:event_id>/", views.template_event_details, name="template_event_details"),
    path("templates/edit_subevents/<int:template_id>/", views.edit_subevents, name="edit_subevents"),
    path("templates/show_templates/", views.show_templates, name="show_templates"),
    path("tubes/connections/<int:template_id>/<int:event_id>/", views.event_subevents_template, name="event_subevents_template"),
    path("services/", views.services_menu, name="services_menu"),
    path("services/create_service/", views.create_service, name="create_service"),
    path("services/show_services/", views.show_services, name="show_services"),
    path("services/add_service/<int:service_id>/", views.add_service, name="add_service"),
    path("services/service_details/<int:service_id>/", views.service_details, name="service_details"),
]