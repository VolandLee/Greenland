from django.db import models
from django.urls import reverse

from .regexp import *
import re
from importlib import reload
import datetime
from django.contrib.auth import get_user_model
from django.db.models.query import QuerySet
from django.db import models, connection


class Actions(models.Model):
    action_id = models.IntegerField(primary_key=True)
    action_name = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'actions'


class Ans(models.Model):
    supplier_id = models.IntegerField()
    supplier_name = models.CharField(max_length=45)
    email = models.CharField(max_length=45)
    phone = models.BigIntegerField()
    postcode = models.IntegerField()
    region_id = models.IntegerField()
    city_id = models.IntegerField()
    street = models.CharField(max_length=45)
    h_number = models.IntegerField()
    website = models.CharField(max_length=45, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'ans'


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.BooleanField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.BooleanField()
    is_active = models.BooleanField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Barcodes(models.Model):
    barcode_id = models.BigIntegerField(primary_key=True)
    catalog = models.ForeignKey('Catalog', models.DO_NOTHING)
    supplier = models.ForeignKey('Suppliers', models.DO_NOTHING)
    barcode_name = models.CharField(max_length=45)
    country = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'barcodes'


class Catalog(models.Model):
    catalog_id = models.IntegerField(primary_key=True)
    catalog_name = models.CharField(max_length=45)
    parent_id = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'catalog'


class City(models.Model):
    city_id = models.IntegerField(primary_key=True)
    city_name = models.CharField(max_length=45, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'city'


class Client_Order(models.Model):
    client_order_id = models.IntegerField(primary_key=True)
    client = models.ForeignKey('Clients', models.DO_NOTHING)
    product = models.ForeignKey('Products', models.DO_NOTHING)
    from_premise = models.ForeignKey('Premises', models.DO_NOTHING, related_name='from_premise_co')
    to_premise = models.ForeignKey('Premises', models.DO_NOTHING, related_name='to_premise_co')
    client_price = models.DecimalField(max_digits=10, decimal_places=2,)
    order_date = models.DateTimeField()
    delivery_date = models.DateTimeField(blank=True, null=True)
    received_date = models.DateTimeField(blank=True, null=True)
    sizex = models.IntegerField(blank=True, null=True)
    sizey = models.IntegerField(blank=True, null=True)
    sizez = models.IntegerField(blank=True, null=True)
    weight = models.DecimalField(max_digits=8, decimal_places=3, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'client_order'


class Client_Routes(models.Model):
    client_route_id = models.IntegerField(primary_key=True)
    delivery = models.ForeignKey('Delivery', models.DO_NOTHING, blank=True, null=True)
    client_order = models.ForeignKey(Client_Order, models.DO_NOTHING)
    point = models.ForeignKey('Premises', models.DO_NOTHING, related_name='point')
    next_point = models.ForeignKey('Premises', models.DO_NOTHING, related_name='next_point')
    start_date = models.DateTimeField(blank=True, null=True)
    end_date = models.DateTimeField(blank=True, null=True)
    status = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'client_routes'


class Clients(models.Model):
    client = models.OneToOneField(to=get_user_model(), on_delete=models.DO_NOTHING)
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
        verbose_name_plural = "Clients"

    def __str__(self):
        return f'id={self.client}'

class ControlPoints(models.Model):
    control_points_id = models.IntegerField(primary_key=True)
    employee = models.ForeignKey('Employees', models.DO_NOTHING)
    product = models.ForeignKey('Products', models.DO_NOTHING)
    action = models.ForeignKey(Actions, models.DO_NOTHING)
    premise = models.ForeignKey('Premises', models.DO_NOTHING)
    time = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'control_points'


class Delivery(models.Model):
    delivery_id = models.IntegerField(primary_key=True)
    delivery_name = models.CharField(max_length=45)
    email = models.CharField(max_length=45)
    phone = models.BigIntegerField()
    postcode = models.IntegerField()
    region = models.ForeignKey('Region', models.DO_NOTHING)
    city = models.ForeignKey(City, models.DO_NOTHING)
    street = models.CharField(max_length=45)
    h_number = models.IntegerField()
    website = models.CharField(max_length=45, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'delivery'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.SmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Employees(models.Model):
    employee_id = models.IntegerField(primary_key=True)
    premise = models.ForeignKey('Premises', models.DO_NOTHING)
    fname = models.CharField(max_length=45)
    lname = models.CharField(max_length=45)
    patronymic = models.CharField(max_length=45)
    email = models.CharField(max_length=45)
    password = models.CharField(max_length=45)
    phone = models.BigIntegerField()
    postcode = models.IntegerField()
    region = models.ForeignKey('Region', models.DO_NOTHING)
    city = models.ForeignKey(City, models.DO_NOTHING)
    street = models.CharField(max_length=45)
    h_number = models.IntegerField()
    gender = models.BooleanField()
    birth_date = models.DateField()
    hire_date = models.DateField()
    chief = models.ForeignKey('self', models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'employees'


class Goodslist(models.Model):
    goodslist_id = models.IntegerField(primary_key=True)
    product = models.ForeignKey('Products', models.DO_NOTHING)
    premise = models.ForeignKey('Premises', models.DO_NOTHING)
    quantity = models.IntegerField()
    sizex = models.IntegerField()
    sizey = models.IntegerField()
    sizez = models.IntegerField()
    weight = models.DecimalField(max_digits=8, decimal_places=3)


class Meta:
        managed = False
        db_table = 'goodslist'


class PremiseType(models.Model):
    premise_type_id = models.IntegerField(primary_key=True)
    type_decryp = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'premise_type'


class Premises(models.Model):
    premise_id = models.AutoField(primary_key=True)
    premise_type = models.ForeignKey(PremiseType, models.DO_NOTHING)
    coord_long = models.FloatField()
    coord_lat = models.FloatField()
    email = models.CharField(max_length=45)
    phone = models.BigIntegerField()
    postcode = models.IntegerField()
    region = models.ForeignKey('Region', models.DO_NOTHING)
    city = models.ForeignKey(City, models.DO_NOTHING)
    street = models.CharField(max_length=45)
    h_number = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'premises'


class Products(models.Model):
    product_id = models.IntegerField(primary_key=True)
    barcode = models.ForeignKey(Barcodes, models.DO_NOTHING)
    supplier_price = models.DecimalField(max_digits=10, decimal_places=2)
    client_price = models.DecimalField(max_digits=10, decimal_places=2)
    quantity = models.IntegerField()
    available = models.BooleanField()

    class Meta:
        managed = False
        db_table = 'products'


class Region(models.Model):
    region_id = models.IntegerField(primary_key=True)
    region_name = models.CharField(max_length=90, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'region'


class Supplier_Order(models.Model):
    supplier_order_id = models.IntegerField(primary_key=True)
    supplier = models.ForeignKey('Suppliers', models.DO_NOTHING)
    product = models.ForeignKey(Products, models.DO_NOTHING)
    from_premise = models.ForeignKey(Premises, models.DO_NOTHING, db_column='from_premise', related_name='from_premise')
    to_premise = models.ForeignKey(Premises, models.DO_NOTHING, db_column='to_premise', related_name='to_premise')
    current_supplier_route = models.ForeignKey('Supplier_Routes', models.DO_NOTHING, blank=True, null=True)
    supplier_price = models.DecimalField(max_digits=10, decimal_places=2)
    quantity = models.IntegerField()
    order_date = models.DateTimeField()
    delivery_date = models.DateTimeField(blank=True, null=True)
    sizex = models.IntegerField()
    sizey = models.IntegerField()
    sizez = models.IntegerField()
    weight = models.DecimalField(max_digits=8, decimal_places=3)

    class Meta:
        managed = False
        db_table = 'supplier_order'




class Supplier_Routes(models.Model):
    supplier_route_id = models.AutoField(primary_key=True)
    parent = models.ForeignKey('self', models.DO_NOTHING, blank=True, null=True)
    delivery = models.ForeignKey(Delivery, models.DO_NOTHING)
    goodslist = models.ForeignKey(Goodslist, models.DO_NOTHING, blank=True, null=True)
    point = models.ForeignKey(Premises, models.DO_NOTHING, blank=True, null=True, related_name='point_sr')
    next_point = models.ForeignKey(Premises, models.DO_NOTHING, related_name='next_point_sr')
    start_date = models.DateTimeField(blank=True, null=True)
    end_date = models.DateTimeField(blank=True, null=True)
    status = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'supplier_routes'


class Suppliers(models.Model):
    supplier_id = models.IntegerField(primary_key=True)
    supplier_name = models.CharField(max_length=45)
    email = models.CharField(max_length=45)
    phone = models.BigIntegerField()
    postcode = models.IntegerField()
    region = models.ForeignKey(Region, models.DO_NOTHING)
    city = models.ForeignKey(City, models.DO_NOTHING)
    street = models.CharField(max_length=45)
    h_number = models.IntegerField()
    website = models.CharField(max_length=45, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'suppliers'


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
        verbose_name_plural = "Clients"

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

"""
