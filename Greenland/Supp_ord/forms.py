from .models import *
from django.forms import ModelForm, TextInput, forms


class AddSupp(ModelForm):
    class Meta:
        model = Suppliers
        fields = ['supplier_name', 'email', 'phone', 'postcode', 'region', 'city', 'street', 'h_number',
                  'website']

