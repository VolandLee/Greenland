from django.urls import path, include
from . import views

urlpatterns= [path('add_supplier', views.add_supplier, name='add_supplier'),
path('profile', views.profile, name='profile')

]