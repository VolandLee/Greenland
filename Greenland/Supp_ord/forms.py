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


class AddBarcode(forms.Form):
    barcode_id = forms.IntegerField(label='Штрихкод', widget=forms.TextInput(attrs={'class': 'form-input'}))
    catalog = forms.IntegerField(label='Каталог', widget=forms.TextInput(attrs={'class': 'form-input'}))
    barcode_name = forms.CharField(label='Название', widget=forms.TextInput(attrs={'class': 'form-input'}))
    country = forms.CharField(label='Страна производитель', widget=forms.TextInput(attrs={'class': 'form-input'}))


class AddProduct(forms.Form):
    supplier_price = forms.DecimalField(label='Закупочная цена', widget=forms.TextInput(attrs={'class': 'form-input'}))
    client_price = forms.DecimalField(label='Цена для клиента', widget=forms.TextInput(attrs={'class': 'form-input'}))
    quantity = forms.IntegerField(label='Количество', widget=forms.TextInput(attrs={'class': 'form-input'}))


class AddGoods(ModelForm):
    class Meta:
        model = Goodslist
        fields = ['product', 'premise', 'quantity', 'sizex', 'sizey',
                  'sizez', 'weight']


class AddSuppRoutes(ModelForm):
    class Meta:
        model = Supplier_Routes
        fields = ['parent', 'delivery', 'goodslist', 'point', 'next_point',
                  'start_date', 'end_date', 'status']


class AddPremise(ModelForm):
    class Meta:
        model = Premises
        fields = ['premise_type', 'coord_long', 'coord_lat', 'email', 'phone',
                  'postcode', 'region', 'city', 'street', 'h_number']


class CreateSupplierOrder(forms.Form):
    class Meta:
        model = Supplier_Order
        fields = ['supplier_order_id', 'supplier', 'barcode', 'from_premise', 'to_premise', 'client_price',
                  'supplier_price', 'quantity', 'order_date', 'sizex', 'sizey', 'sizez', 'weight']


class UpdateRoute(forms.Form):
    client_order_id = forms.IntegerField(label='Номер заказа')
    premise_id = forms.IntegerField(label="Номер склада прибытие")


class SuppOrdDet(forms.Form):
    supplier = forms.IntegerField(label='Поставщик', required=False,
                                  widget=forms.TextInput(attrs={'class': 'form-input'}))
    barcode = forms.IntegerField(label='Штрихкод', required=False,
                                 widget=forms.TextInput(attrs={'class': 'form-input'}))
    product = forms.IntegerField(label='Продукт', required=False, widget=forms.TextInput(attrs={'class': 'form-input'}))
    from_premise = forms.IntegerField(label='Склад поставщика', required=False,
                                      widget=forms.TextInput(attrs={'class': 'form-input'}))
    to_premise = forms.IntegerField(label='Склад доставки',
                                    widget=forms.TextInput(attrs={'class': 'form-input'}))
    sx = forms.IntegerField(label='Длина в мм',
                            widget=forms.TextInput(attrs={'class': 'form-input'}))
    sy = forms.IntegerField(label='Ширина в мм',
                            widget=forms.TextInput(attrs={'class': 'form-input'}))
    sz = forms.IntegerField(label='Высота в мм',
                            widget=forms.TextInput(attrs={'class': 'form-input'}))
    w = forms.DecimalField(label='Масса',
                           widget=forms.TextInput(attrs={'class': 'form-input'}))


class RegisterUserForm(UserCreationForm):
    username = forms.CharField(label='Логин', widget=forms.TextInput(attrs={'class': 'form-input'}))
    email = forms.EmailField(label='Email', widget=forms.EmailInput(attrs={'class': 'form-input'}))
    password1 = forms.CharField(label='Пароль', widget=forms.PasswordInput(attrs={'class': 'form-input'}))
    password2 = forms.CharField(label='Повтор пароля', widget=forms.PasswordInput(attrs={'class': 'form-input'}))

    class Meta:
        model = User
        fields = ('username', 'email', 'password1', 'password2')
