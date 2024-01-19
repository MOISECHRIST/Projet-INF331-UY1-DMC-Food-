from django.shortcuts import render
from django.contrib.auth import logout, login, authenticate
from django.shortcuts import render,get_object_or_404,redirect
from shopapp.models import Commande, Quartier
from userapp.models import Simple_User
from django.contrib.auth.models import User

def index(request):
    return render(request, "index.html")

def logout_user(request):
    logout(request)
    return redirect('home')

def singup_view(request):
    #Inserer Fetch
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

def edit_user_view(request):
    #Inserer Fetch
    quarters=Quartier.objects.all()
    return render(request, "edit-user-info.html", context={'quarters':quarters})

def research_view(request):
    #Inserer Fetch
    return render(request, "research.html")

def orders_view(request):
    #Inserer Fetch
    user=User.objects.get(username=request.user)
    profil=Simple_User.objects.get(account=user)
    orders=Commande.objects.filter(utilisateur=profil)
    return render(request, "gestion-cmd.html", context={"orders":orders})