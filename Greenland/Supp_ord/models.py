from django.db import models

# Create your models here.
"""
class Players(models.Model):
    player_id = models.AutoField(primary_key=True)
    first_name = models.CharField(max_length=16)
    last_name = models.CharField(max_length=16)
    country = models.CharField(max_length=16, blank=True, null=True)
    city = models.CharField(max_length=16, blank=True, null=True)
    date_of_birth = models.DateField(blank=True, null=True)
    business = models.CharField(max_length=16, blank=True, null=True)
    about = models.TextField(blank=True, null=True)
"""

class Catalog(models.Model):
    catalog_id = models.AutoField(primary_key=True)
    catalog_name = models.CharField(max_length=45)
    parent = models.ForeignKey('Catalog', models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'catalog'

    def __str__(self):
        return f'id={self.catalog_id}, {self.catalog_name}, Родитель_{self.parent}'


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

class Clients(models.Model):
    client_id = models.AutoField(primary_key=True)
    FName = models.CharField(max_length=45)
    LName = models.CharField(max_length=45)
    Patronymic = models.CharField(max_length=45)
    email = models.CharField(max_length=45)
    password = models.CharField(max_length=45)
    phone = models.BigIntegerField
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
        return f'id={self.client_id}, {self.FName}, {self.LName}'


class Premises(models.Model):
    premise_id = models.AutoField(primary_key=True)
    premise_type = models.ForeignKey('Premise_type', models.DO_NOTHING, null=True)
    coord_long = models.FloatField()
    coord_lat = models.FloatField()
    email = models.CharField(max_length=45)
    phone = models.BigIntegerField
    postcode = models.IntegerField()
    region = models.ForeignKey('Region', models.DO_NOTHING, null=True)
    city = models.ForeignKey('City', models.DO_NOTHING, null=True)
    street = models.CharField(max_length=45)
    h_number = models.IntegerField()


    class Meta:
        managed = False
        db_table = 'premises'
    def __str__(self):
        return f'id={self.premise_id}, {self.premise_type_id}, {self.region}, {self.city}'


class Employees(models.Model):
    employee_id = models.AutoField(primary_key=True)
    premise = models.ForeignKey('Premises', models.DO_NOTHING, null=True)
    FName = models.CharField(max_length=45)
    LName = models.CharField(max_length=45)
    Patronymic = models.CharField(max_length=45)
    email = models.CharField(max_length=45)
    password = models.CharField(max_length=45)
    phone = models.BigIntegerField
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



class Clients_order(models.Model):
    clients_order_id = models.AutoField(primary_key=True)
    client = models.ForeignKey('Clients', models.DO_NOTHING, null=True)
    barcode = models.ForeignKey('Products', models.DO_NOTHING, null=True)
    client_price = models.DecimalField(max_digits=10, decimal_places=2)
    quantity = models.IntegerField()
    order_date = models.DateTimeField()
    delivery_date = models.DateTimeField(blank=True, null=True)
    received_date = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'clients_order'
    def __str__(self):
        return f'id={self.clients_order_id}, {self.client}, {self.barcode}, {self.order_date}'


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
    delivery_id = models.AutoField(primary_key = True)
    delivery_name = models.CharField(max_length=45)
    email = models.CharField(max_length=45)
    phone = models.BigIntegerField
    postcode = models.IntegerField()
    region = models.ForeignKey('Region', models.DO_NOTHING, null=True)
    city = models.ForeignKey('City', models.DO_NOTHING, null=True)
    street = models.CharField(max_length=45)
    h_number = models.IntegerField()
    website = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'delivery'
    def __str__(self):
        return f'id={self.delivery_id}, {self.delivery_id}'


class Goodslist(models.Model):
    goodslist_id = models.AutoField(primary_key = True)
    barcode = models.ForeignKey('Products', models.DO_NOTHING, null=True)
    premise = models.ForeignKey('Premises', models.DO_NOTHING, null=True)
    quantity = models.IntegerField()
    sizex = models.IntegerField()
    sizey = models.IntegerField()
    sizez = models.IntegerField()
    weight = models.DecimalField(max_digits=8, decimal_places=3)


    class Meta:
        managed = False
        db_table = 'goodslist'
    def __str__(self):
        return f'id={self.goodslist_id}, {self.barcode}, {self.quantity}'


class Products(models.Model):
    barcode_id = models.BigIntegerField(primary_key=True)
    catalog = models.ForeignKey('Catalog', models.DO_NOTHING, null=True)
    supplier = models.ForeignKey('Suppliers', models.DO_NOTHING, null=True)
    product_name = models.CharField(max_length=45)
    supplier_price = models.DecimalField(max_digits=10, decimal_places=2)
    client_price = models.DecimalField(max_digits=10, decimal_places=2)
    country = models.CharField(max_length=45)
    available = models.BooleanField()

    class Meta:
        managed = False
        db_table = 'products'
    def __str__(self):
        return f'id={self.barcode_id}, {self.product_name}, Категория:{self.catalog}'



class Supplier_order(models.Model):
    supplier_order_id = models.AutoField(primary_key = True)
    supplier = models.ForeignKey('Suppliers', models.DO_NOTHING, null=True)
    barcode = models.ForeignKey('Products', models.DO_NOTHING, null=True)
    supplier_price = models.DecimalField(max_digits=10, decimal_places=2)
    quantity = models.IntegerField()
    order_date = models.DateTimeField()
    delivery_date = models.DateTimeField()
    recieved_date = models.DateTimeField()


    class Meta:
        managed = False
        db_table = 'supplier_order'
    def __str__(self):
        return f'id={self.supplier_order_id}, {self.barcode}, {self.supplier_price}, {self.order_date}'



class Suppliers(models.Model):
    supplier_id = models.AutoField(primary_key = True)
    supplier_name = models.CharField(max_length=45)
    email = models.CharField(max_length=45)
    phone = models.BigIntegerField
    postcode = models.IntegerField()
    region = models.ForeignKey('Region', models.DO_NOTHING, null=True)
    city = models.ForeignKey('City', models.DO_NOTHING, null=True)
    street = models.CharField(max_length=45)
    h_number = models.IntegerField()
    website = models.CharField(max_length=45, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'suppliers'
    def __str__(self):
        return f'id={self.supplier_id}, {self.supplier_name}'


class Transfers(models.Model):
    transfer_id = models.AutoField(primary_key = True)
    delivery = models.ForeignKey('Delivery', models.DO_NOTHING, null=True)
    barcode = models.ForeignKey('Products', models.DO_NOTHING, null=True)
    from_premise = models.ForeignKey('Premises', models.DO_NOTHING, related_name='from_premise',  null=True)
    to_premise = models.ForeignKey('Premises', models.DO_NOTHING, related_name='to_premise',  null=True)
    start_date = models.DateTimeField()
    end_date = models.DateTimeField()
    quantity = models.IntegerField()
    sizex = models.IntegerField()
    sizey = models.IntegerField()
    sizez = models.IntegerField()
    weight = models.DecimalField(max_digits=8, decimal_places=3)


    class Meta:
        managed = False
        db_table = 'transfers'
    def __str__(self):
        return f'id={self.transfer_id}, {self.delivery}, {self.barcode}'


class Actions(models.Model):
    action_id = models.AutoField(primary_key = True)
    action_name = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'actions'
    def __str__(self):
        return f'id={self.action_id}, {self.action_name}'