from django.contrib import admin
from .models import *

# Register your models here.
admin.site.register(Catalog)
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

class ProductsAdmin(admin.ModelAdmin):
    list_display = ['product_id', 'client_price', 'quantity']
    list_display_links = ['product_id']
    search_fields = []


admin.site.register(Products, ProductsAdmin)
admin.site.register(Supplier_Order)
admin.site.register(Suppliers)
admin.site.register(Actions)
admin.site.register(Client_Routes)
admin.site.register(Supplier_Routes)

admin.site.register(Barcodes)
