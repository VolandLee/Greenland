from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User

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


class AddBarcode(ModelForm):
    class Meta:
        model = Barcodes
        fields = ['barcode_id', 'catalog', 'supplier', 'barcode_name', 'country']


class AddProduct(ModelForm):
    class Meta:
        model = Products
        fields = ['barcode', 'supplier_price', 'client_price', 'quantity', 'available']


class CreateSupplierOrder(forms.Form):
    class Meta:
        model = Supplier_Order
        fields = ['supplier_order_id', 'supplier', 'barcode', 'from_premise', 'to_premise', 'client_price',
                  'supplier_price', 'quantity', 'order_date', 'sizex', 'sizey', 'sizez', 'weight']


class UpdateRoute(forms.Form):
    client_order_id = forms.IntegerField(label='Номер заказа')
    premise_id = forms.IntegerField(label="Номер склада прибытие")


class RegisterUserForm(UserCreationForm):
    username = forms.CharField(label='Логин', widget=forms.TextInput(attrs={'class': 'form-input'}))
    email = forms.EmailField(label='Email', widget=forms.EmailInput(attrs={'class': 'form-input'}))
    password1 = forms.CharField(label='Пароль', widget=forms.PasswordInput(attrs={'class': 'form-input'}))
    password2 = forms.CharField(label='Повтор пароля', widget=forms.PasswordInput(attrs={'class': 'form-input'}))

    class Meta:
        model = User
        fields = ('username', 'email', 'password1', 'password2')

