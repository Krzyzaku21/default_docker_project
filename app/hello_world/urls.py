from . import views
from django.urls import path

app_name = 'hello_world'

urlpatterns = [
    path('', views.hello),
]
