from django.shortcuts import render
from django.shortcuts import render, redirect
from .models import *
from .forms import *
from django.db import connection

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


def profile(request):
    profile = Suppliers.objects.all()
    return render(request, template_name='Supp_ord/profile.html', context={'profile': profile})