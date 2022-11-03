from django.contrib import admin
from .models import *
# Register your models here.
admin.site.register(Catalog)
admin.site.register(City)
admin.site.register(Region)
admin.site.register(Clients)
admin.site.register(Premise_type)
admin.site.register(Premises)
admin.site.register(Employees)