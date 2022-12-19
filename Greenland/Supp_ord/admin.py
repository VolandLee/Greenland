from django.contrib import admin
from .models import *
from django.contrib import admin



# Register your models here.

admin.site.register(City)
admin.site.register(Region)
admin.site.register(Clients)
admin.site.register(PremiseType)
admin.site.register(Premises)
admin.site.register(Employees)
admin.site.register(Client_Order)
admin.site.register(ControlPoints)
admin.site.register(Delivery)
admin.site.register(Goodslist)




admin.site.register(Products)
admin.site.register(Supplier_Order)
admin.site.register(Suppliers)
admin.site.register(Actions)
admin.site.register(Client_Routes)
admin.site.register(Supplier_Routes)

admin.site.register(Barcodes)
