import datetime
from django.core.exceptions import *
from django.db import transaction
from django.db import models
from .models import *
from django.db.models.query import QuerySet
from django.db.models import F
@transaction.atomic
def create_order_supplier(goodslist_id, delivery_id, to_premise_id, start_date, quantity, size, weight, **kwargs):
    if 'from_premise' in kwargs.keys():
        Goodslist.objects.filter(goodslist_id=1).update(quantity=F('quantity') - quantity)
    else:
        Products.add_products(barcode_id=kwargs['barcode_id'], catalog_id=kwargs['catalog_id'],
                              supplier_id=kwargs['supplier_id'], product_name=kwargs['product_name'],
                              supplier_price=kwargs['supplier_price'], client_price=kwargs['client_price'],
                                 country=kwargs['country'], available=0)

    Transfers.add_transfer(delivery_id=delivery_id, barcode_id=kwargs['barcode_id'], to_premise_id=to_premise_id,
                           start_date=datetime.datetime.now(), quantity=quantity, sizex=size[0],
                           sizey=size[1],
                           sizez=size[2], weight=weight, **kwargs)


@transaction.atomic
def create_supplier_order(supplier_id, barcode_id, supplier_price, quantity):

