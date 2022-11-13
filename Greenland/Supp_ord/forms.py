from .models import *
from django.forms import ModelForm, TextInput
from django import forms


class AddSupp(ModelForm):
    class Meta:
        model = Suppliers
        fields = ['supplier_name', 'email', 'phone', 'postcode', 'region', 'city', 'street', 'h_number',
                  'website']

"""
class AddTransferSO(ModelForm):
    class Meta:
        model = Transfers_supplier_order
        fields = ['barcode', 'from_premise', 'to_premise', 'order_date', 'quantity',
                  'sizex', 'sizey', 'sizez', 'weight', 'status', 'order']
"""

class BuyProduct(forms.Form):
    quantity = forms.IntegerField(label='Выберите количество товара')