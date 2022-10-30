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
    catalog = models.CharField(max_length=45)
    parent_id = models.ForeignKey('catalog', models.CASCADE)

    class Meta:
        managed = False
        db_table = 'catalog'



