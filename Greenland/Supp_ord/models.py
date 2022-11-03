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

