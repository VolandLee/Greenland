from django.dispatch import receiver
from django.db.models.signals import *
from django.conf import settings
from .models import *
import re
from .regexp import *
from .func import *
from django.db.models import F

"""
@receiver(post_save, sender=Supplier_order, dispatch_uid='plot_routes')
def plot_routes_for_new_supplier_order(sender, instance, created, **kwargs):
    if created:
        create_transfers_supplier_order(instance.from_premise_id, instance.to_premise_id, instance.transfer_id)
    if instance.from_premise_id:
        g = Goodslist.objects.get(premise_id=instance.from_premise_id,
                                  barcode_id=instance.product_id)
        p = Products.objects.get(barcode_id=instance.product_id)
        g.quantity -= instance.quantity
        p.quantity -= instance.quantity
        p.save()
        g.save()

"""


