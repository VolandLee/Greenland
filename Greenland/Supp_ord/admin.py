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
admin.site.register(Client_order)
admin.site.register(Control_points)
admin.site.register(Delivery)
admin.site.register(Goodslist)


class ProductsAdmin(admin.ModelAdmin):
    list_display = ['product_id', 'client_price', 'quantity']
    list_display_links = ['product_id']
    search_fields = []


admin.site.register(Products, ProductsAdmin)
admin.site.register(Supplier_order)
admin.site.register(Suppliers)
admin.site.register(Actions)
admin.site.register(Client_routes)
admin.site.register(Supplier_routes)
admin.site.register(Barcodes)
