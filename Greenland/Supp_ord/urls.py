from django.urls import path, include
from . import views

urlpatterns = [path('add_supplier/', views.add_supplier, name='add_supplier'),
               path('account/', include('django.contrib.auth.urls'), name='account'),
               path('profile/', views.profile, name='profile'),
               path('profile/myorders', views.myorders, name='myorders'),
               path('', views.home, name='home'),
               path('register/', views.RegisterUser.as_view(), name='register'),
               path('details/<int:product_id>/', views.product_details, name='details'),
               path('buy_product/<int:product_id>/', views.buy_product, name='buy_product'),
               path('add_barcode/', views.add_barcode, name='add_barcode'),
               path('add_product/', views.add_product, name='add_product'),
               path('category/<int:cat_id>/', views.show_category, name='category'),
               # path('create_supplier_order/',views.create_supplier_order, name='create_supplier_order'),
               path('accept_product/', views.client_routes_update_status, name='accept_product'),
               path('add_supplier_order/', views.add_supplier_order, name='add_supplier_order'),
               path('find_result/', views.find_result, name='find_result'),
               path('add_premise/', views.add_premise, name='add_premise'),
               path('add_goodslist/', views.add_goodslist, name='add_goodslist'),
               path('add_supplier_route/', views.add_supplier_route, name='add_supplier_route')
               ]
# path('new_supplier_order', views.new_supplier_order, name='new_supplier_order'
