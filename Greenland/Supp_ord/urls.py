from django.urls import path, include
from . import views

urlpatterns = [path('add_supplier/', views.add_supplier, name='add_supplier'),
              path('account/', include('django.contrib.auth.urls'), name='account'),
              path('profile/', views.profile, name='profile'),
              path('', views.home, name='home'),
              path('<int:product_id>/', views.product_details, name='product_details'),
              path('buy_product/<int:product_id>/', views.buy_product, name='buy_product')



]
#path('new_supplier_order', views.new_supplier_order, name='new_supplier_order'