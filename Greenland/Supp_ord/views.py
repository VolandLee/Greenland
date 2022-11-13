from django.shortcuts import render
from django.shortcuts import render, redirect
from .models import *
from .forms import *
from django.db import connection
from django.db import transaction
from django.db.models.query import QuerySet
from django.db.models import F
from django.contrib.auth import authenticate, login
from django.contrib.auth.decorators import login_required
from .func import *
from django.contrib import messages

def login_user(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(request, username=username,
                        password=password)
    if user is not None:
        login(request, user)
        redirect('profile')
    else:
        render(request, template_name='Supp_ord/login_user', context={})


def profile(request):
    if request.user.is_authenticated:
        return render(request, template_name='Supp_ord/profile.html')
    else:
        return redirect('login')


    # product = request.POST.get('buy_product')


def add_supplier(request):
    error = ''
    if request.method == 'POST':
        form = AddSupp(request.POST)
        if form.is_valid():
            form.save()
            return redirect('profile')
        else:
            error = 'Введённые значения некорректны'
    else:
        form = AddSupp
        context = {'form': form, 'error': error, 'title': 'Добавление нового поставщика'}
        return render(request, template_name='Supp_ord/add_supplier.html', context=context)


def home(request):
    products = Products.objects.all()
    return render(request, template_name='Supp_ord/home.html', context={'products': products})

"""
@transaction.atomic
def create_new_transfer_supplier_order(request):
    error = ''
    if request.method == 'POST':
        form = AddTransferSO(request.POST)
        if form.is_valid():
            form.save()
        else:
            error = 'Введённые значения некорректны'
    Supplier_order.add_supplier_order(supplier_id=)
"""

def product_details(request, product_id):
    product = Products.objects.get(product_id=product_id)
    if request.method == 'POST':
        if request.user.is_authenticated:
            return redirect('buy_product', product_id)
            #Clients.objects.create(client_name=)
            pass
        else:
            return redirect('login')
        # product = request.POST.get('buy_product')

    return render(request, template_name='Supp_ord/product.html', context={'product': product})


@transaction.atomic
def buy_product(request, product_id):
    try:
        product = Products.objects.get(product_id=product_id)
    except ObjectDoesNotExist:
        messages.error(request, "Продукт не найден")
        return render(request, template_name='Supp_ord/buy_product.html')
    if request.method == 'POST':
        form = BuyProduct(request.POST)
        if form.is_valid():
            quantity = int(form['quantity'].value())
            print(quantity)
            from_premise_id = product.goodslist.premise_id
            if quantity <= product.quantity:
                product.goodslist.quantity -= quantity
                product.quantity -= quantity
                product.save()
                product.goodslist.save()
                current_user_id = request.user.id
                current_client = Clients.objects.get(client_id=current_user_id)
                total_cost = product.client_price * quantity
                if current_client.balance < total_cost:
                    messages.error(request, "Недостаточно средств")
                    return render(request, template_name='Supp_ord/buy_product.html')
                current_client.balance -= total_cost
                current_client.save()
                user_received_point = current_client.received_point_id
                client_order = Client_order.objects.create(client_id=current_user_id, product_id=product_id,
                                                     from_premise_id=from_premise_id,
                                                     to_premise_id=user_received_point,
                                                     client_price=product.client_price, quantity=quantity,
                                                     order_date=datetime.datetime.now())
                print(from_premise_id, user_received_point, client_order.client_order_id)
                create_routes_client_order(start_premise_id=from_premise_id, end_premise_id=user_received_point,
                                           client_order_id=client_order.client_order_id)
            else:
                if quantity == 1:
                    ValueError('Товар закончился')
                else:
                    ValueError('На складе не соталось столько товар. Пожалкуйста уменьшите количество')
    else:
        form = BuyProduct
    return render(request, template_name='Supp_ord/buy_product.html', context={'form': form, 'product': product})

