from django.apps import AppConfig


class SuppOrdConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'Supp_ord'
    verbose_name = 'Supp Ord'

    def ready(self):
        from . import signals
