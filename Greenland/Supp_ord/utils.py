from .models import *
from .views import *

menu = [{'title': "На главную", 'url_name': 'home'},
        {'title': "Профиль", 'url_name': 'profile'},
        {'title': "Выйти из профиля", 'url_name': 'logout'},
        ]
class DataMixin:
    def get_user_context(self, **kwargs):
        context = kwargs
        context['menu'] = menu
        return context