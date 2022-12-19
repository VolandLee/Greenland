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

menu = [{'title': 'Каталог товаров', 'url_name': 'home'},
        {'title': "На главную", 'url_name': 'home'},
        {'title': "Профиль", 'url_name': 'profile'},
        {'title': "Выйти из профиля", 'url_name': 'logout'},
        {'title': "Войти", 'url_name': 'login'}
        ]


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
    category = Catalog.objects.all()
    barcode_i = []
    products = []
    barcode = Barcodes.objects.all()
    barcode_id = barcode.values_list('barcode_id')
    for i in barcode_id:
        barcode_i.append(i[0])
    for i in barcode_i:
        products.append(Products.objects.filter(barcode=i))
    context = {'menu': menu, 'category': category, 'products': products, 'barcode': barcode}
    return render(request, template_name='Supp_ord/index.html', context=context)


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


def show_category(request, cat_id):
    barcode_i = []
    products = []
    barcode = Barcodes.objects.filter(catalog=cat_id)
    barcode_id = barcode.values_list('barcode_id')
    for i in barcode_id:
        barcode_i.append(i[0])
    for i in barcode_i:
        products.append(Products.objects.filter(barcode=i))
    context = {'menu': menu, 'products': products}
    return render(request, template_name='Supp_ord/index.html', context=context)


def product_details(request, product_id):
    products = Products.objects.get(product_id=product_id)
    if request.method == 'POST':
        if request.user.is_authenticated:
            return redirect('buy_product', product_id)
            # Clients.objects.create(client_name=)
            pass
        else:
            return redirect('login')
        # product = request.POST.get('buy_product')
    context = {'menu': menu, 'products': products}

    return render(request, template_name='Supp_ord/product.html', context=context)


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

            form_kwargs = {el.name: int(el.value()) for el in form}
            quantity = form_kwargs['quantity']
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

    context = {'form': form, 'product': product, 'menu': menu}

    return render(request, template_name='Supp_ord/buy_product.html', context=context)


def add_barcode(request):
    if request.method == 'POST':
        form = AddBarcode(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Штрихкод умпешно добавлен')
        else:
            messages.error(request, 'Введите корректные значения!')
        return render(request, template_name='Supp_ord/add_barcode.html')
    else:
        form = AddBarcode
        return render(request, template_name='Supp_ord/add_barcode.html',
                      context={'form': form, 'tittle': 'Добавление штрихкода'})


def add_product(request):
    if request.method == 'POST':
        form = AddProduct(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Продукт умпешно добавлен')
        else:
            messages.error(request, 'Введите корректные значения!')
        return render(request, template_name='Supp_ord/add_product.html')
    else:
        form = AddProduct
        return render(request, template_name='Supp_ord/add_product.html',
                      context={'form': form, 'tittle': 'Добавление продукта'})


@transaction.atomic
def create_supplier_order(request):
    if request.method == 'POST':
        form = CreateSupplierOrder(request.POST)
        if form.is_valid():

            form_kwargs = {el.name: int(el.value()) for el in form}
            form.save()

            create_routes_supplier_order(start_premise_id=form_kwargs['from_premise_id'],
                                         end_premise_id=form_kwargs['to_premise_id'],
                                         supplier_order_id=form_kwargs['supplier_order_id'])

        else:
            if quantity == 1:
                ValueError('Товар закончился')
            else:
                ValueError('На складе не соталось столько товар. Пожалкуйста уменьшите количество')

    else:
        form = BuyProduct
        return render(request, template_name='Supp_ord/buy_product.html', context={'form': form, 'product': product})


"""
def routes_update_status(request):
    if request.method == 'POST':
        form = UpdateRoute(request.POST)

        if form.is_valid():
            form_kwargs = {el.name: int(el.value()) for el in form}
            if client_routes_update_status(form_kwargs['client_order_id'], form_kwargs['premise_id']):
                Client_order.objects.get(form_kwargs['client_order_id']).update(delivery_date=datetime.datetime.now())
                #здесь надо отправить email пользователю, что посылка прибыла и ожидает получения
        else:
            messages.error(request, 'Введите корректные значения!')
            return render(request, template_name='Supp_ord/routes_update_status.html')
    else:
        form = AddProduct
        return render(request, template_name='Supp_ord/add_product.html',
                          context={'form': form, 'tittle': 'Обновления статуса доставки'})

"""
