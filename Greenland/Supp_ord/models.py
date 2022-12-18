from django.db import models
from django.urls import reverse

from .regexp import *
import re
from importlib import reload
import datetime
from django.contrib.auth import get_user_model
from django.db.models.query import QuerySet
from django.db import models

# Create your models here.
"""



class ClientsManager(models.Manager):
    def add_client(self, FName, LName, Patronymic, email, password, phone, postcode, region_id, city_id, street, h_number, gender, birth_date, balance, liked):
        if re.fullmatch(reFIO, f'{FName} {LName} {Patronymic} ') and re.search(reemail, email):
            Clients.objects.create(FName=FName, LName=LName, Patronymic=Patronymic, email=email, password=password, phone=phone, postcode=postcode,
                             region_id=region_id,
                             city_id=city_id, street=street, h_number=h_number, gender=gender,
                             birth_date=birth_date,
                             balance=balance, liked=liked)
            return('Клиент добавлен1')
        else:
            raise ValueError('Клиент не добавлен. Пожадуйста введите корректные данные')
"""


class Clients(models.Model):
    client = models.ForeignKey(to=get_user_model(), primary_key=True, on_delete=models.DO_NOTHING)
    received_point = models.ForeignKey(to='Premises', on_delete=models.DO_NOTHING)
    phone = models.BigIntegerField()
    postcode = models.IntegerField()
    region = models.ForeignKey('Region', models.DO_NOTHING, null=True)
    city = models.ForeignKey('City', models.DO_NOTHING, null=True)
    street = models.CharField(max_length=45)
    h_number = models.IntegerField()
    gender = models.BooleanField()
    birth_date = models.DateField()
    balance = models.DecimalField(max_digits=10, decimal_places=2)
    liked = models.JSONField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'clients'

    def __str__(self):
        return f'id={self.client}'

    objects = models.Manager()

    @staticmethod
    def add_client(FName, LName, Patronymic, email, password, phone, postcode, region_id, city_id, street, h_number,
                   gender, birth_date, balance, liked=[]):
        if re.fullmatch(reFIO, f'{FName} {LName} {Patronymic} ') and re.search(reemail, email):
            models.Manager.objects.create(FName=FName, LName=LName, Patronymic=Patronymic, email=email,
                                          password=password, phone=phone, postcode=postcode,
                                          region_id=region_id,
                                          city_id=city_id, street=street, h_number=h_number, gender=gender,
                                          birth_date=birth_date,
                                          balance=balance, liked=liked)
            return ('Клиент добавлен')
        else:
            raise ValueError('Клиент не добавлен. Пожадуйста введите корректные данные')


class Client_routes(models.Model):
    client_route_id = models.AutoField(primary_key=True)
    delivery_id = models.IntegerField()  # ForeignKey('Delivery', models.DO_NOTHING, blank=True, null=True)
    client_order = models.ForeignKey('Client_order', models.DO_NOTHING)
    point = models.ForeignKey('Premises', models.DO_NOTHING, related_name='point_id_co', blank=True, null=True)
    next_point = models.ForeignKey('Premises', models.DO_NOTHING, related_name='next_point_id_co')
    start_date = models.DateTimeField()
    end_date = models.DateTimeField()
    status = models.IntegerField()

    objects = models.Manager()

    class Meta:
        managed = False
        db_table = 'client_routes'

    def __str__(self):
        return f'id={self.client_route_id}, Откуда={self.point}, Куда={self.next_point}'


class Supplier_routes(models.Model):
    supplier_route_id = models.AutoField(primary_key=True)
    delivery = models.ForeignKey('Delivery', models.DO_NOTHING, blank=True, null=True)
    supplier_order = models.ForeignKey('Supplier_order', models.DO_NOTHING)
    point = models.ForeignKey('Premises', models.DO_NOTHING, related_name='point_id_so', blank=True, null=True)
    next_point = models.ForeignKey('Premises', models.DO_NOTHING, related_name='next_point_id_so')
    start_date = models.DateTimeField()
    end_date = models.DateTimeField()
    status = models.IntegerField()

    objects = models.Manager()

    class Meta:
        managed = False
        db_table = 'supplier_routes'

    def __str__(self):
        return f'id={self.supplier_route_id}, Откуда={self.point}, Куда={self.next_point}, Служба доставки={self.delivery}'


class Catalog(models.Model):
    catalog_id = models.AutoField(primary_key=True)
    catalog_name = models.CharField(max_length=45)
    parent = models.ForeignKey('Catalog', models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'catalog'

    def __str__(self):
        return f'id={self.catalog_id}, {self.catalog_name}, Родитель={self.parent}'

    def get_absolute_url(self):
        return reverse('category', kwargs={'cat_id': self.pk})


class Premise_type(models.Model):
    premise_type_id = models.AutoField(primary_key=True)
    type_decryp = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'premise_type'

    def __str__(self):
        return f'id={self.premise_type_id}, {self.type_decryp}'


class City(models.Model):
    city_id = models.AutoField(primary_key=True)
    city_name = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'city'

    def __str__(self):
        return f'id={self.city_id}, {self.city_name}'


class Region(models.Model):
    region_id = models.AutoField(primary_key=True)
    region_name = models.CharField(max_length=90)

    class Meta:
        managed = False
        db_table = 'region'

    def __str__(self):
        return f'id={self.region_id}, {self.region_name}'


class Premises(models.Model):
    premise_id = models.AutoField(primary_key=True)
    premise_type = models.ForeignKey('Premise_type', models.DO_NOTHING, null=True)
    coord_long = models.FloatField()
    coord_lat = models.FloatField()
    email = models.EmailField()
    phone = models.BigIntegerField()
    postcode = models.IntegerField()
    region = models.ForeignKey('Region', models.DO_NOTHING, null=True)
    city = models.ForeignKey('City', models.DO_NOTHING, null=True)
    street = models.CharField(max_length=45)
    h_number = models.IntegerField()

    objects = models.Manager()

    class Meta:
        managed = False
        db_table = 'premises'

    def __str__(self):
        return f'id={self.premise_id}, {self.premise_type}, {self.region}, {self.city}'


class Employees(models.Model):
    employee_id = models.AutoField(primary_key=True)
    premise = models.ForeignKey('Premises', models.DO_NOTHING, null=True)
    FName = models.CharField(max_length=45)
    LName = models.CharField(max_length=45)
    Patronymic = models.CharField(max_length=45)
    email = models.EmailField()
    password = models.CharField(max_length=45)
    phone = models.BigIntegerField()
    postcode = models.IntegerField()
    region = models.ForeignKey('Region', models.DO_NOTHING, null=True)
    city = models.ForeignKey('City', models.DO_NOTHING, null=True)
    street = models.CharField(max_length=45)
    h_number = models.IntegerField()
    gender = models.BooleanField()
    birth_date = models.DateField()
    hire_date = models.DateField()
    chief = models.ForeignKey('Catalog', models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'employees'

    def __str__(self):
        return f'id={self.employee_id}, {self.FName}, {self.LName}'

    objects = models.Manager()

    @staticmethod
    def add_employee(premise_id, FName, LName, Patronymic, email, password, phone, postcode, region_id, city_id, street,
                     h_number, gender, birth_date, hire_date, *args):
        if re.fullmatch(reFIO, f'{FName} {LName} {Patronymic} ') and re.search(reemail, email):
            models.Manager.objects.create(premise_id=premise_id, FName=FName, LName=LName, Patronymic=Patronymic,
                                          email=email, password=password,
                                          phone=phone, postcode=postcode,
                                          region_id=region_id,
                                          city_id=city_id, street=street, h_number=h_number, gender=gender,
                                          birth_date=birth_date,
                                          hire_date=hire_date, *args)
            return ('Работник добавлен')
        else:
            raise ValueError('Работник не добавлен. Пожадуйста введите корректные данные')


class Client_order(models.Model):
    client_order_id = models.AutoField(primary_key=True)
    client = models.ForeignKey('Clients', models.DO_NOTHING, null=True)
    product = models.ForeignKey('Products', models.DO_NOTHING, null=True)
    from_premise = models.ForeignKey('Premises', models.DO_NOTHING, related_name='from_premise_co')
    to_premise = models.ForeignKey('Premises', models.DO_NOTHING, related_name='to_premise_co')
    client_price = models.DecimalField(max_digits=10, decimal_places=2)
    quantity = models.IntegerField()
    order_date = models.DateTimeField()
    delivery_date = models.DateTimeField(blank=True, null=True)
    received_date = models.DateTimeField(blank=True, null=True)
    sizex = models.IntegerField(blank=True, null=True)
    sizey = models.IntegerField(blank=True, null=True)
    sizez = models.IntegerField(blank=True, null=True)
    weight = models.DecimalField(max_digits=8, decimal_places=3, blank=True, null=True)

    objects = models.Manager()

    class Meta:
        managed = False
        db_table = 'client_order'

    def __str__(self):
        return f'id={self.client_order_id}, {self.client}, {self.product}, {self.order_date}'


class Control_points(models.Model):
    control_points_id = models.AutoField(primary_key=True)
    employee = models.ForeignKey('Employees', models.DO_NOTHING, null=True)
    barcode = models.ForeignKey('Products', models.DO_NOTHING, null=True)
    action = models.ForeignKey('Actions', models.DO_NOTHING, null=True)
    premise = models.ForeignKey('Premises', models.DO_NOTHING, null=True)
    time = models.DateTimeField(())

    class Meta:
        managed = False
        db_table = 'control_points'

    def __str__(self):
        return f'id={self.control_points_id}, {self.employee}, {self.barcode}, {self.action}, {self.premise}'


class Delivery(models.Model):
    delivery_id = models.AutoField(primary_key=True)
    delivery_name = models.CharField(max_length=45)
    email = models.EmailField()
    phone = models.BigIntegerField()
    postcode = models.IntegerField()
    region = models.ForeignKey('Region', models.DO_NOTHING, null=True)
    city = models.ForeignKey('City', models.DO_NOTHING, null=True)
    street = models.CharField(max_length=45)
    h_number = models.IntegerField()
    website = models.CharField(max_length=45, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'delivery'

    def __str__(self):
        return f'id={self.delivery_id}'

    objects = models.Manager()


class Goodslist(models.Model):
    goodslist_id = models.AutoField(primary_key=True)
    barcode = models.ForeignKey('Barcodes', models.DO_NOTHING)
    premise = models.ForeignKey('Premises', models.DO_NOTHING)
    quantity = models.IntegerField()
    sizex = models.IntegerField()
    sizey = models.IntegerField()
    sizez = models.IntegerField()
    weight = models.DecimalField(max_digits=8, decimal_places=3)

    objects = models.Manager()

    class Meta:
        managed = False
        db_table = 'goodslist'

    def __str__(self):
        return f'id={self.goodslist_id}, {self.barcode}, {self.quantity}'

    @staticmethod
    def add_goodslist(barcode_id, premise_id, quantity, sizex, sizey, sizez, weight):
        Goodslist.objects.create(barcode_id=barcode_id, premise_id=premise_id, quantity=quantity,
                                 sizex=sizex, sizey=sizey, sizez=sizez, weight=weight)


class Barcodes(models.Model):
    barcode_id = models.BigIntegerField(primary_key=True)
    catalog = models.ForeignKey('Catalog', models.DO_NOTHING, null=True)
    supplier = models.ForeignKey('Suppliers', models.DO_NOTHING, null=True)
    barcode_name = models.CharField(max_length=45)
    country = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'barcodes'

    def __str__(self):
        return f'barcode_id={self.barcode_id}, Название={self.barcode_name} Категория={self.catalog}, Произдводитель={self.supplier}'


class Products(models.Model):
    product_id = models.AutoField(primary_key=True)
    barcode = models.ForeignKey('Barcodes', models.DO_NOTHING)
    goodslist = models.ForeignKey('Goodslist', models.DO_NOTHING)
    supplier_price = models.DecimalField(max_digits=10, decimal_places=2)
    client_price = models.DecimalField(max_digits=10, decimal_places=2)
    quantity = models.IntegerField()
    available = models.BooleanField()

    class Meta:
        managed = False
        db_table = 'products'

    def __str__(self):
        return f'product_id={self.product_id}, Цена={self.client_price}, Количество на складе{self.quantity}'

    objects = models.Manager()

    def get_absolute_url(self):
        return reverse('details', kwargs={'product_id': self.pk})

    @classmethod
    def add_products(cls, barcode_id, catalog_id, supplier_id, product_name, supplier_price, client_price, country,
                     available):
        try:
            cls.objects.create(barcode_id=barcode_id, catalog_id=catalog_id, supplier_id=supplier_id,
                               product_name=product_name, supplier_price=supplier_price,
                               client_price=client_price, country=country, available=available)
            print('Продукт добавлен')
        except Exception:
            print('Продукт не добавлен. Пожадуйста введите корректные данные')


class Supplier_order(models.Model):
    supplier_order_id = models.AutoField(primary_key=True)
    supplier = models.ForeignKey('Suppliers', models.DO_NOTHING, null=True)
    barcode = models.ForeignKey('Products', models.DO_NOTHING, null=True)
    from_premise = models.ForeignKey('Premises', models.DO_NOTHING, related_name='from_premise_so', blank=True,
                                     null=True)
    to_premise = models.ForeignKey('Premises', models.DO_NOTHING, related_name='to_premise_so')
    client_price = models.DecimalField(max_digits=10, decimal_places=2)
    supplier_price = models.DecimalField(max_digits=10, decimal_places=2)
    quantity = models.IntegerField()
    order_date = models.DateTimeField()
    delivery_date = models.DateTimeField(blank=True, null=True)
    sizex = models.IntegerField()
    sizey = models.IntegerField()
    sizez = models.IntegerField()
    weight = models.DecimalField(max_digits=8, decimal_places=3)

    objects = models.Manager()

    class Meta:
        managed = False
        db_table = 'supplier_order'

    def __str__(self):
        return f'id={self.supplier_order_id}, {self.barcode}, {self.supplier_price}, {self.order_date}'

    @staticmethod
    def add_supplier_order(supplier_id, barcode_id, supplier_price, quantity):
        Supplier_order.objects.create(supplier_id=supplier_id, barcode_id=barcode_id,
                                      supplier_price=supplier_price, quantity=quantity,
                                      order_date=datetime.datetime.now())


class Suppliers(models.Model):
    supplier_id = models.AutoField(primary_key=True)
    supplier_name = models.CharField(max_length=45)
    email = models.EmailField()
    phone = models.BigIntegerField()
    postcode = models.IntegerField()
    region = models.ForeignKey('Region', models.DO_NOTHING, null=True)
    city = models.ForeignKey('City', models.DO_NOTHING, null=True)
    street = models.CharField(max_length=45)
    h_number = models.IntegerField()
    website = models.CharField(max_length=45, blank=True, null=True)

    objects = models.Manager()

    class Meta:
        managed = False
        db_table = 'suppliers'

    def __str__(self):
        return f'id={self.supplier_id}, {self.supplier_name}'

    """
    @classmethod
    def add_transfer(cls, delivery_id, barcode_id, from_premise_id, to_premise_id, start_date, quantity, sizex, sizey, sizez, weight, *args):
        cls.objects.create(delivery_id=delivery_id, barcode_id=barcode_id, from_premise_id=from_premise_id, to_premise_id=to_premise_id, start_date=start_date,
                               quantity=quantity,
                               sizex=sizex, sizey=sizey, sizez=sizez, weight=weight, *args)
    """


class Actions(models.Model):
    action_id = models.AutoField(primary_key=True)
    action_name = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'actions'

    def __str__(self):
        return f'id={self.action_id}, {self.action_name}'
