from django.contrib.auth.forms import UserCreationForm
from django.shortcuts import render
from django.shortcuts import render, redirect
from django.urls import reverse_lazy
from django.views.generic import CreateView
from .utils import *
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
from itertools import chain
from django.contrib.auth.models import User
from django.contrib.auth.mixins import AccessMixin
from django.http import HttpResponseRedirect

menu = [{'title': "На главную", 'url_name': 'home'},
        {'title': "Профиль", 'url_name': 'profile'},
        {'title': "Выйти из профиля", 'url_name': 'logout'},
        ]


def add_supplier(request):
    error = ''
    if request.method == 'POST':

        form = AddSupp(request.POST)
        if form.is_valid():

            kwargs = {el.name: el.value() for el in form}
            with connection.cursor() as cursor:
                cursor.callproc('add_supplier_f_id', [kwargs['supplier_name'], kwargs['email'],
                                                      kwargs['phone'], kwargs['postcode'],
                                                      kwargs['region'], kwargs['city'],
                                                      kwargs['street'], kwargs['h_number'],
                                                      kwargs['website']])

                request.session['supplier'] = cursor.fetchone()[0]

            return redirect('find_result')
        else:
            error = 'Введённые значения некорректны'
    else:
        form = AddSupp

        context = {'form': form, 'error': error, 'title': 'Добавление нового поставщика'}
        return render(request, template_name='Supp_ord/add_supplier.html', context=context)


def add_product(request):
    error = ''
    if request.method == 'POST':

        form = AddProduct(request.POST)
        if form.is_valid():

            kwargs = {el.name: el.value() for el in form}
            with connection.cursor() as cursor:
                cursor.callproc('add_product_f_3val', [request.session['barcode'], kwargs['supplier_price'],
                                                       kwargs['client_price'], kwargs['quantity']])
                request.session['product'] = [str(el) for el in cursor.fetchone()]

            return redirect('find_result')
        else:
            error = 'Введённые значения некорректны'
    else:
        form = AddProduct

        context = {'form': form, 'error': error, 'title': 'Добавление нового продукта'}
        return render(request, template_name='Supp_ord/add_product.html', context=context)


def add_barcode(request):
    error = ''
    if request.method == 'POST':

        form = AddBarcode(request.POST)
        if form.is_valid():

            kwargs = {el.name: el.value() for el in form}
            with connection.cursor() as cursor:
                cursor.callproc('add_barcode_f_id',
                                [kwargs['barcode_id'], kwargs['catalog'], request.session['supplier'],
                                 kwargs['barcode_name'], kwargs['country']])

                request.session['barcode'] = kwargs['barcode_id']

            return redirect('find_result')
        else:
            error = 'Введённые значения некорректны'
    else:
        form = AddBarcode

        context = {'form': form, 'error': error, 'title': 'Добавление нового штрихкода'}
        return render(request, template_name='Supp_ord/add_barcode.html', context=context)


def add_premise(request):
    error = ''
    if request.method == 'POST':

        form = AddPremise(request.POST)
        if form.is_valid():

            kwargs = {el.name: el.value() for el in form}
            with connection.cursor() as cursor:
                cursor.callproc('add_premise_f_id', [kwargs['premise_type'], kwargs['coord_long'],
                                                     kwargs['coord_lat'], kwargs['email'],
                                                     kwargs['phone'], kwargs['postcode'],
                                                     kwargs['region'], kwargs['city'],
                                                     kwargs['street'], kwargs['h_number']])

                request.session['from_premise'] = cursor.fetchone()[0]

            return redirect('find_result')
        else:
            error = 'Введённые значения некорректны'
    else:
        form = AddPremise

        context = {'form': form, 'error': error, 'title': 'Добавление нового склада поставщика'}
        return render(request, template_name='Supp_ord/add_premise.html', context=context)


def add_goodslist(request):
    error = ''
    if request.method == 'POST':

        form = AddGoods(request.POST)
        if form.is_valid():

            kwargs = {el.name: el.value() for el in form}
            with connection.cursor() as cursor:
                cursor.callproc('add_goodslist_f_id', [kwargs['product'], kwargs['premise'],
                                                       kwargs['quantity'], kwargs['sizex'],
                                                       kwargs['sizey'], kwargs['sizez'],
                                                       kwargs['weight']])

                request.session['goodslist'] = [str(el) for el in cursor.fetchone()]

            return redirect('home')
        else:
            error = 'Введённые значения некорректны'
    else:
        form = AddGoods

        context = {'form': form, 'error': error, 'title': 'Добавление нового гудлиста'}
        return render(request, template_name='Supp_ord/add_goodslist.html', context=context)


def add_supplier_route(request):
    error = ''
    if request.method == 'POST':

        form = AddSuppRoutes(request.POST)
        if form.is_valid():

            kwargs = {el.name: el.value() for el in form}
            with connection.cursor() as cursor:
                cursor.callproc('add_supplier_route_f_id', [kwargs['parent'], kwargs['delivery'],
                                                       kwargs['goodslist'], kwargs['point'],
                                                       kwargs['next_point'], kwargs['start_date'],
                                                       kwargs['end_date'], kwargs['status']])

                request.session['supplier_route'] = [str(el) for el in cursor.fetchone()]

            return redirect('home')
        else:
            error = 'Введённые значения некорректны'
    else:
        form = AddSuppRoutes

        context = {'form': form, 'error': error, 'title': 'Добавление нового маршрута'}
        return render(request, template_name='Supp_ord/add_supplier_route.html', context=context)


def add_supplier_order(request):
    request.session.flush()
    error = ''

    if request.method == 'POST':

        form = SuppOrdDet(request.POST)
        if form.is_valid():
            for el in form:
                request.session[el.name] = el.value()
            for el in request.session.keys():
                print(f'{el}   : {request.session[el]}')
            print('------------------------------------')
            return redirect('find_result')



    else:

        form = SuppOrdDet
        context = {'form': form, 'error': error, 'title': 'Информация'}
        return render(request, template_name='Supp_ord/create_supplier_order.html', context=context)


def find_result(request):
    for el in request.session.keys():
        print(f'{el}   : {request.session[el]}')
    print('------------------------------------')
    if not request.session['supplier']:
        return redirect('add_supplier')
    if not request.session['barcode']:
        return redirect('add_barcode')
    if not request.session['product']:
        return redirect('add_product')
    if not request.session['from_premise']:
        return redirect('add_premise')
    with connection.cursor() as cursor:
        cursor.callproc('create_supplier_order_f_id', [request.session['supplier'], request.session['product'][0],
                                                       request.session['from_premise'],
                                                       request.session['to_premise'],
                                                       request.session['product'][1], request.session['product'][2],
                                                       request.session['sx'], request.session['sy'],
                                                       request.session['sz'], request.session['w']])
        request.session['s_o'] = cursor.fetchone()[0]
    request.session.flush()


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
    client_data = Clients.objects.get(client_id=request.user.id)
    if request.user.is_authenticated:
        user = request.user.username
        context = {'menu': menu, 'user': user, 'client_data': client_data}
        return render(request, template_name='Supp_ord/profile.html', context=context)
    else:
        return redirect('login')

    # product = request.POST.get('buy_product')


def myorders(request):
    order_data = Client_Order.objects.filter(client_id=request.user.id)
    context = {'menu': menu, 'order_data': order_data}
    return render(request, template_name='Supp_ord/profile.html', context=context)


def home(request):
    category = Catalog.objects.filter(parent_id__isnull=True)
    context = {'menu': menu, 'category': category
               }
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
    category = Catalog.objects.filter(parent_id__isnull=True)
    name_of_category = Catalog.objects.get(catalog_id=cat_id)
    parent = Catalog.objects.filter(parent_id=cat_id)
    products = Products.objects.filter(barcode_id__in=Barcodes.objects.filter(catalog_id=cat_id))
    parents = (Products.objects.filter(
        barcode_id__in=Barcodes.objects.filter(catalog_id__in=Catalog.objects.filter(parent_id=cat_id))))
    context = {'menu': menu, 'products': products, 'category': category, 'name': name_of_category, 'parents': parents,
               'parent': parent}
    return render(request, template_name='Supp_ord/index.html', context=context)


def product_details(request, product_id):
    products = Products.objects.get(product_id=product_id)
    if request.method == 'POST':
        if request.user.is_authenticated:
            # if request.user.groups.filter(name="Logistician").exists():
            return redirect('buy_product', product_id)
            # Clients.objects.create(client_name=)
        else:
            return redirect('login')
        # product = request.POST.get('buy_product')
    context = {'menu': menu, 'products': products}

    return render(request, template_name='Supp_ord/product.html', context=context)


@transaction.atomic
def buy_product(request, product_id):
    try:
        goodslist = Goodslist.objects.get(product=product_id)
        products = Products.objects.get(product_id=product_id)
    except ObjectDoesNotExist:
        messages.error(request, "Продукт не найден")
        return render(request, template_name='Supp_ord/buy_product.html', context={})
    if request.method == 'POST':
        form = BuyProduct(request.POST)
        if form.is_valid():

            form_kwargs = {el.name: int(el.value()) for el in form}
            quantity = form_kwargs['quantity']
            from_premise_id = goodslist.premise_id
            if quantity <= goodslist.product.quantity:
                goodslist.product.quantity -= quantity
                goodslist.quantity -= quantity
                goodslist.product.save()
                goodslist.save()
                current_user_id = request.user.id
                current_client = Clients.objects.get(client_id=current_user_id)
                total_cost = goodslist.product.client_price * quantity
                if current_client.balance < total_cost:
                    messages.error(request, "Недостаточно средств")
                    return render(request, template_name='Supp_ord/buy_product.html')
                current_client.balance -= total_cost
                current_client.save()
                user_received_point = current_client.received_point_id
                client_order = Client_Order.objects.create(client_id=current_user_id,
                                                           product_id=product_id,
                                                           from_premise_id=from_premise_id,
                                                           to_premise_id=user_received_point,
                                                           client_price=total_cost,
                                                           order_date=datetime.datetime.now())
                print(from_premise_id, user_received_point, client_order.client_order_id)
                return render(request, template_name='Supp_ord/profile.html')
            else:
                if quantity == 1:
                    ValueError('Товар закончился')
                else:
                    ValueError('На складе не соталось столько товар. Пожалкуйста уменьшите количество')
    else:
        form = BuyProduct()

    context = {'form': form, 'products': products, 'menu': menu}

    return render(request, template_name='Supp_ord/buy_product.html', context=context)


"""
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

"""


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
"""


def routes_update_status(request):
    if request.method == 'POST':
        form = UpdateRoute(request.POST)

        if form.is_valid():
            form_kwargs = {el.name: int(el.value()) for el in form}
            if client_routes_update_status(form_kwargs['client_order_id'], form_kwargs['premise_id']):
                Client_Order.objects.get(form_kwargs['client_order_id']).update(delivery_date=datetime.datetime.now())
                # здесь надо отправить email пользователю, что посылка прибыла и ожидает получения
        else:
            messages.error(request, 'Введите корректные значения!')
            return render(request, template_name='Supp_ord/routes_update_status.html')
    else:
        form = AddProduct
        return render(request, template_name='Supp_ord/add_product.html',
                      context={'form': form, 'tittle': 'Обновления статуса доставки'})


class RegisterUser(DataMixin, CreateView):
    form_class = RegisterUserForm
    template_name = 'Supp_ord/register.html'
    success_url = reverse_lazy('login')

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super().get_context_data(**kwargs)
        c_def = self.get_user_context(title="Регистрация")
        return dict(list(context.items()) + list(c_def.items()))


class Finance(AccessMixin, CreateView):

    def dispatch(self, request, *args, **kwargs):
        if not request.user.is_authenticated:
            # This will redirect to the login view
            return self.handle_no_permission()
        if not self.request.user.groups.filter(name="FinanceGrp").exists():
            # Redirect the user to somewhere else - add your URL here
            return HttpResponseRedirect(...)

        # Checks pass, let http method handlers process the request
        return super().dispatch(request, *args, **kwargs)
