import datetime
from django.core.exceptions import *
from django.db import transaction
from django.db import models
from .models import *
from django.db.models.query import QuerySet
from django.db.models import F
import datetime
from django.db import connection


def create_supplier_order(kwargs):
    c = connection.cursor()
    c.callproc('create_supplier_order', (kwargs['supplier_id'], kwargs['product_id'], kwargs['from_premise'],
                                         kwargs['to_premise'], kwargs['start_supplier_route_id'],
                                         kwargs['supplier_price'], kwargs['quantity'], kwargs['order_date'],
                                         kwargs['sizex'], kwargs['sizey'], kwargs['sizez'], kwargs['wieght']))


"""
@transaction.atomic
def create_order_supplier(goodslist_id, delivery_id, to_premise_id, start_date, quantity, size, weight, **kwargs):
    if 'from_premise' in kwargs.keys():
        Goodslist.objects.filter(goodslist_id=1).update(quantity=F('quantity') - quantity)
    else:
        Products.add_products(barcode_id=kwargs['barcode_id'], catalog_id=kwargs['catalog_id'],
                              supplier_id=kwargs['supplier_id'], product_name=kwargs['product_name'],
                              supplier_price=kwargs['supplier_price'], client_price=kwargs['client_price'],
                                 country=kwargs['country'], available=0)

    Transfers.add_transfer(delivery_id=delivery_id, barcode_id=kwargs['barcode_id'], to_premise_id=to_premise_id,
                           start_date=datetime.datetime.now(), quantity=quantity, sizex=size[0],
                           sizey=size[1],
                           sizez=size[2], weight=weight, **kwargs)

"""


def create_transfers_supplier_order(start_premise_id, end_premise_id, transfer_id):
    if start_premise_id:
        start = Premises.objects.get(premise_id=start_premise_id)
        next = start
        point = next.premise_id
    else:
        Supplier_routes.objects.create(next_point_id=11,
                                       transfer_id=transfer_id, status=0)
        start = Premises.objects.get(premise_id=11)  # 11 id Главного складв
        point = None
        next = start

    end = Premises.objects.get(premise_id=end_premise_id)
    if start.premise_type_id - end.premise_type_id >= 0:
        flag_forward = True
    else:
        flag_forward = False

    while next.premise_id != end.premise_id:
        if flag_forward is True:
            if start.premise_type_id == 3:
                next = Premises.objects.get(region_id=end.region_id, premise_type_id=3)
                if next.premise_id == start.premise_id:
                    next = Premises.objects.get(city_id=end.city_id, premise_type_id=2)
                Supplier_routes.objects.create(point_id=start.premise_id, next_point_id=next.premise_id,
                                               transfer_id=transfer_id, status=0)
                start = next
            elif start.premise_type_id == 2:
                Supplier_routes.objects.create(point_id=start.premise_id, next_point_id=end.premise_id,
                                               transfer_id=transfer_id, status=0)
                next.premise_id = end.premise_id
            else:
                Supplier_routes.objects.create(point_id=start.premise_id, next_point_id=end.premise_id,
                                               transfer_id=transfer_id, status=0)
                next.premise_id = end.premise_id
        else:
            if start.premise_type_id == 2:
                next = Premises.objects.get(region_id=start.region_id, premise_type_id=3)
                Supplier_routes.objects.create(point_id=start.premise_id, next_point_id=next.premise_id,
                                               transfer_id=transfer_id, status=0)
                Supplier_routes.objects.create(point_id=next.premise_id, next_point_id=end.premise_id,
                                               transfer_id=transfer_id, status=0)
                next.premise_id = end.premise_id
            else:
                next = Premises.objects.get(city_id=start.city_id, premise_type_id=2)
                Supplier_routes.objects.create(point_id=start.premise_id, next_point_id=next.premise_id,
                                               transfer_id=transfer_id, status=0)
                start = next
    else:
        s = Supplier_routes.objects.get(transfer_id=transfer_id, point_id=point)
        s.status = 1
        s.save()


def client_routes_update_status(client_order_id, premise_id):
    """
    Supplier_routes.status расшифровка
    0 - товар ещё не поступил на склад (default)
    1 - товар в ожидании отправки
    2 - товар отправлен и находиться в пути
    3 - товар принят на склад
    4 - отправка отменена
    """
    try:
        current_premises = Client_routes.objects.get(client_order_id=client_order_id, point_id=premise_id)
        if current_premises.status == 1:
            current_premises.status = 2
        elif current_premises.status == 0:
            current_premises.status = 1
            past_premises = Client_routes.objects.get(client_order_id=client_order_id, next_point_id=premise_id)
            past_premises.status = 3
            past_premises.save()
        current_premises.save()
        return False
    except ObjectDoesNotExist:
        past_premises = Client_routes.objects.get(client_order_id=client_order_id, next_point_id=premise_id)
        past_premises.status = 3
        past_premises.save()
        return True


def create_routes_client_order(start_premise_id, end_premise_id, client_order_id):
    current = Premises.objects.get(premise_id=start_premise_id)
    end = Premises.objects.get(premise_id=end_premise_id)
    if current.premise_type_id == 3:
        next = Premises.objects.get(region_id=end.region_id, premise_type_id=3)
        Client_routes.objects.create(client_order_id=client_order_id, point_id=start_premise_id,
                                     next_point_id=next.premise_id,
                                     status=0)
        current = next
        next = Premises.objects.get(city_id=end.city_id, premise_type_id=2)
        Client_routes.objects.create(client_order_id=client_order_id, point_id=current.premise_id,
                                     next_point_id=next.premise_id, status=0)
        current = next
    if current.premise_type_id == 2:
        Client_routes.objects.create(client_order_id=client_order_id, point_id=current.premise_id,
                                     next_point_id=end.premise_id, status=1)


def supplier_routes_update_status(transfer_id, premise_id):
    """
    Supplier_routes.status расшифровка
    0 - товар ещё не поступил на склад (default)
    1 - товар в ожидании отправки
    2 - товар отправлен и находиться в пути
    3 - товар принят на склад
    4 - отправка отменена
    """
    try:
        current_premises = Supplier_routes.objects.get(transfer_id=transfer_id, point_id=premise_id)
        if current_premises.status == 1:
            current_premises.status = 2
        elif current_premises.status == 0:
            current_premises.status = 1
            past_premises = Supplier_routes.objects.get(transfer_id=transfer_id, next_point_id=premise_id)
            past_premises.status = 3
            past_premises.save()
        current_premises.save()
        return False
    except ObjectDoesNotExist:
        past_premises = Supplier_routes.objects.get(transfer_id=transfer_id, next_point_id=premise_id)
        past_premises.status = 3
        past_premises.save()
        return True


def create_routes_supplier_order(supplier_order_id, start_premise_id, end_premise_id):
    current_point = Premises.objects.get(premise_id=start_premise_id)
    next_point = ''
    end_point = Premises.objects.get(premise_id=end_premise_id)
    while next_point != end_point:
        if current_point.premise_type_id == 4:
            try:
                next_point = Premises.objects.get(premise_type_id=3, region_id=end_point.region_id)
            except ObjectDoesNotExist:
                next_point = Premises.objects.get(premise_id=1)
        if current_point.premise_type_id == 3:
            next = Premises.objects.get(region_id=end_point.region_id, premise_type_id=3)
            Client_routes.objects.create(client_order_id=client_order_id, point_id=start_premise_id,
                                         next_point_id=next.premise_id,
                                         status=0)
            current = next
            next = Premises.objects.get(city_id=end.city_id, premise_type_id=2)
            Client_routes.objects.create(client_order_id=client_order_id, point_id=current.premise_id,
                                         next_point_id=next.premise_id, status=0)
            current = next
        if current.premise_type_id == 2:
            Client_routes.objects.create(client_order_id=client_order_id, point_id=current.premise_id,
                                         next_point_id=end.premise_id, status=1)

        if current_point.premise_type_id == end_point:
            Supplier_routes.objects.create(suplier_order_id=supplier_order_id, point_id=start_premise_id,
                                           next_point_id=next_point, status=0)
            current.premise_type_id -= 1

    if current.premise_type_id == 3:
        next = Premises.objects.get(region_id=end.region_id, premise_type_id=3)
        Client_routes.objects.create(client_order_id=client_order_id, point_id=start_premise_id,
                                     next_point_id=next.premise_id,
                                     status=0)
        current = next
        next = Premises.objects.get(city_id=end.city_id, premise_type_id=2)
        Client_routes.objects.create(client_order_id=client_order_id, point_id=current.premise_id,
                                     next_point_id=next.premise_id, status=0)
        current = next
    if current.premise_type_id == 2:
        Client_routes.objects.create(client_order_id=client_order_id, point_id=current.premise_id,
                                     next_point_id=end.premise_id, status=1)


"""
    while next.premise_id != end.premise_id:
        if flag_forward is True:
            if start.premise_type_id == 3:
                next = Premises.objects.get(region_id=end.region_id, premise_type_id=3)
                if next.premise_id == start.premise_id:
                    next = Premises.objects.get(city_id=end.city_id, premise_type_id=2)
                Client_routes.objects.create(point_id=start.premise_id, next_point_id=next.premise_id,
                                             transfer_id=transfer_id, status=0)
                start = next
            elif start.premise_type_id == 2:
                Client_routes.objects.create(point_id=start.premise_id, next_point_id=end.premise_id,
                                             transfer_id=transfer_id, status=0)
                next.premise_id = end.premise_id
            else:
                Client_routes.objects.create(point_id=start.premise_id, next_point_id=end.premise_id,
                                             transfer_id=transfer_id, status=0)
                next.premise_id = end.premise_id
        else:
            if start.premise_type_id == 2:
                next = Premises.objects.get(region_id=start.region_id, premise_type_id=3)
                Client_routes.objects.create(point_id=start.premise_id, next_point_id=next.premise_id,
                                             transfer_id=transfer_id, status=0)
                Client_routes.objects.create(point_id=next.premise_id, next_point_id=end.premise_id,
                                             transfer_id=transfer_id, status=0)
                next.premise_id = end.premise_id
            else:
                next = Premises.objects.get(city_id=start.city_id, premise_type_id=2)
                Client_routes.objects.create(point_id=start.premise_id, next_point_id=next.premise_id,
                                             transfer_id=transfer_id, status=0)
                start = next
    else:
        s = Client_routes.objects.get(transfer_id=transfer_id, point_id=point)
        s.status = 1
        s.save()
def find_start_premise_id(barcode_id, quantity, from_premise_id):
    g = Goodslist.objects.filter(barcode_id=barcode_id, quantity_gte=quantity)
    if g:
        for el in g:
            if el.premise.region_id == from_premise_id:
                return el.premise_id
        return g[0].premise_id

"""
