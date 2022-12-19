from django.urls import path, include
from . import views

urlpatterns = [path('add_supplier/', views.add_supplier, name='add_supplier'),
               path('account/', include('django.contrib.auth.urls'), name='account'),
               path('profile/', views.profile, name='profile'),
               path('', views.home, name='home'),
               path('details/<int:product_id>/', views.product_details, name='details'),
#               path('buy_product/<int:product_id>/', views.buy_product, name='buy_product'),
              # path('add_barcode/', views.add_barcode, name='add_barcode'),
               #path('add_product/', views.add_product, name='add_product'),
               path('category/<int:cat_id>/', views.show_category, name='category'),
               # path('create_supplier_order/',views.create_supplier_order, name='create_supplier_order'),
               path('accept_product/', views.client_routes_update_status, name='accept_product'),

               ]
# path('new_supplier_order', views.new_supplier_order, name='new_supplier_order'
