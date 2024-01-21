from django.shortcuts import render
from django.contrib.auth import logout, login, authenticate
from django.shortcuts import render,get_object_or_404,redirect
from shopapp.models import Commande, Plat, Ingredient, PlatMenu, PlatHealthPB, RechercherParDescription,Restaurant
from userapp.models import Simple_User, Health_Problem
from django.contrib.auth.models import User
from userapp.serializers import Simple_UserSerializer
from userapp.producer import publish
from shopapp.serializers import CommandeSerializer
from django.urls import reverse
from shopapp.naive_bayes import model_prediction

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

def edit_user_view(request):
    #Inserer Fetch
    exist=True
    user=User.objects.get(username=request.user)
    try:
        profil=Simple_User.objects.get(account=user)
    except:
        profil={}
        exist=False
    
    hpbs=Health_Problem.objects.all()

    if request.method=="POST":
        gender=request.POST.get("gender")
        email=request.POST.get("email")
        phone=request.POST.get("phone")
        date_of_birth=request.POST.get("dateofbird")
        first_name=request.POST.get("firstname")
        last_name=request.POST.get("lastname")
        image=request.POST.get("image")
        heigth=request.POST.get("heigth")
        weigth=request.POST.get("weigth")
        healthPBs=request.POST.get("healthPBs")
        user=User.objects.create_user(first_name=first_name,
                                      last_name=last_name,
                                      email=email)
        login(request,user)

        if exist:
            profil.image=image
            profil.date_of_birth=date_of_birth
            profil.weigth=weigth
            profil.size=heigth
            profil.phone_number=phone
            profil.gender=gender  

            for hpb in healthPBs:
                healthPB=Health_Problem.objects.get(name=hpb)
                profil.health_problem.add(healthPB)
            profil.save()
            serializer=Simple_UserSerializer(profil)
            publish("SimpleUser_updated",serializer.data)
        else:
            profil=Simple_User.objects.create(image=image,
            date_of_birth=date_of_birth,
            weigth=weigth,
            size=heigth,
            phone_number=phone,
            gender=gender,
            account=user)
            serializer=Simple_UserSerializer(profil)
            publish("SimpleUser_updated",serializer.data)
        return redirect("home")
    return render(request, "edit-user-info.html", context={'profil':profil,'hpbs':hpbs})

def research_view(request):
    return render(request, "research.html")

def result_resarch(request, pk):
    plat=Plat.objects.get(pk=pk)
    menu=PlatMenu.objects.filter(plat=plat)
    return render(request,"result_research.html",{'plat':plat, 'menu':menu})

def research_by_name_view(request):
    if request.method=="POST":
        try:
            plat=get_object_or_404(Plat, nom_plat=request.POST.get("nom_plat"))
            return redirect(reverse("result_resarch",kwargs={"pk": plat.pk}))
        except:
            return redirect("result_notfound")
        
    return render(request, "research.html")

def research_by_desc_view(request):
    if request.method=="POST":
        try:
            description=request.POST.get("description_plat")
            name=model_prediction(description)
            RechercherParDescription.objects.create(user=request.user,resultat=name)
            plat=get_object_or_404(Plat, nom_plat=name)
            return redirect(reverse("result_resarch",kwargs={"pk": plat.pk}))
        except:
            return redirect("result_notfound")
    return render(request, "research.html")

def result_notfound(request):
    return render(request,"result_notfound.html")

def orders_view(request):
    user=User.objects.get(username=request.user)
    profil=Simple_User.objects.get(account=user)
    orders=Commande.objects.filter(utilisateur=profil)
    return render(request, "gestion-cmd.html", context={"orders":orders})

def modif_order(request, numero):
    #Inserer Fetch
    order=Commande.objects.get(numero=numero)
    if request.method=="POST":
        date_delai=request.POST.get("date_delai")
        quantite=request.POST.get("quantite")       
        order.date_delai=date_delai
        order.quantite=quantite
        order.save()
        serializer=CommandeSerializer(order)
        publish("Commande_updated",serializer.data)
        return redirect("orders")
    return render(request, "edit-cmd.html", context={"order":order})

def create_order(request, pk):
    resto=Restaurant.object.
    if request.method=="POST":
        user=request.user
        profil=Simple_User.objects.get(account=user)
        plat=Plat.objects.get(pk=pk)
        date_delai=request.POST.get("date_delai")
        date_delai=request.POST.get("date_delai")
        quantite=request.POST.get("quantite")   
        order=Commande.objects.create(
          date_delai=date_delai,
        quantite=quantite,
            plat=plat,
            utilisateur=profil,

        )    
        order.date_delai=date_delai
        order.quantite=quantite
        order.save()
        serializer=CommandeSerializer(order)
        publish("Commande_updated",serializer.data)
        return redirect("orders")
    return render(request,"create-cmd.html", context={"order":order})