from django.shortcuts import render
from django.contrib.auth import logout, login, authenticate
from django.shortcuts import render,get_object_or_404,redirect
from merchantuserapp.models import Menu, Plat, PlatMenu, Restaurant
from shopapp.models import Commande, SimpleUser
from django.contrib.auth.models import User
from shopapp.producer import publish
from shopapp.serializers import CommandeSerializer
from django.urls import reverse

def index(request):
    return render(request, "index.html")

def logout_user(request):
    logout(request)
    return redirect('home')

def singup_view(request):
    if request.method=="POST":
        username=request.POST.get("username")
        password=request.POST.get("password1")
        password2=request.POST.get("password2")
        email=request.POST.get("email")
        if password==password2 :
            user=User.objects.create_user(username=username,
                                        password=password,
                                        email=email)
            login(request,user)
            return redirect('home')
    return render(request, "signup.html")

def login_user(request):
    if request.method=="POST":
        username=request.POST.get("username")
        password=request.POST.get("password")
        
        try:
            user1=authenticate(username=username,password=password)
            login(request,user1)
        except:
            user2=User.objects.get(username=username,password=password)
            login(request,user2) 
        return redirect('home')  
    return render(request, "login.html")

def orders_view(request):
    user=User.objects.get(username=request.user)
    profil=Restaurant.objects.get(account=user)
    orders=Commande.objects.filter(restaurant=profil)
    return render(request, "gestion-cmd.html", context={"orders":orders})

def valider_order(request, numero):
    #Inserer Fetch
    order=Commande.objects.get(numero=numero)
    order.status="Validée"
    order.save()
    serializer=CommandeSerializer(order)
    publish("Commande_updated",serializer.data)
    return redirect('orders')

def annuler_order(request, numero):
    #Inserer Fetch
    order=Commande.objects.get(numero=numero)
    order.status="Annulée"
    order.save()
    serializer=CommandeSerializer(order)
    publish("Commande_updated",serializer.data)
    return redirect('orders')

def view_resto(request, pk):
    resto=Restaurant.objects.get(pk=pk)
    menus=PlatMenu.objects.filter(menu__in=Menu.objects.filter(restaurant=resto))
    return render(request, "resto_page.html", {"resto":resto, "menus":menus})

def edit_user_view(request):
    #Inserer Fetch
    exist=True
    user=User.objects.get(username=request.user)
    try:
        profil=Restaurant.objects.get(account=user)
    except:
        profil={}
        exist=False

    if request.method=="POST":
        return redirect("home")
    return render(request, "edit-user-info.html", context={'profil':profil})
