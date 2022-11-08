from django.dispatch import receiver
from django.db.models.signals import *
from django.conf import settings
from .models import Clients
import re
from .regexp import *
"""

@receiver(post_save, sender=Clients)
"""