from django.db import models
from userapp.models import *
import random
import string
from decouple import config


#1
class Country(models.Model):
    id=models.PositiveIntegerField(primary_key=True)
    name = models.CharField(max_length=50, unique=True)

    def __str__(self):
        return self.name


#2
class City(models.Model):
    id=models.PositiveIntegerField(primary_key=True)
    name = models.CharField(max_length=50)
    country = models.ForeignKey(Country, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.name}({self.country})"
#3
class Quartier(models.Model):
    id=models.PositiveIntegerField(primary_key=True)
    name = models.CharField(max_length=50)
    city = models.ForeignKey(City, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.name}({self.city})"
#4
class Restaurant(models.Model):
    id=models.PositiveIntegerField(primary_key=True)
    restorent_name = models.CharField(max_length=255, blank=True, null=True)
    quartier = models.ForeignKey(Quartier, on_delete=models.CASCADE, null=True)
    phone_number = models.CharField(max_length=255, blank=True)
    longitude = models.FloatField(default=0.0, null=True)
    latitude = models.FloatField(default=0.0, null=True)
    longitude = models.FloatField(default=0.0)
    latitude = models.FloatField(default=0.0)
    image = models.ImageField(upload_to="resto_img", blank=True, null=True)
    livraison_service=models.BooleanField(default=False)
    

    def __str__(self):
        return f"{self.restorent_name}"

#5
class Menu(models.Model):
    JOURS=[
        ("lundi","lundi"),
        ("mardi","mardi"),
        ("mercredi","mercredi"),
        ("jeudi","jeudi"),
        ("vendredi","vendredi"),
        ("samedi","samedi"),
        ("dimanche","dimanche")
    ]
    id=models.PositiveIntegerField(primary_key=True)
    numero=models.CharField(max_length=20,null=False, blank=False, unique=True)
    jour_semaine=models.CharField(max_length=10,choices=JOURS,null=False, blank=False)
    restaurant=models.ForeignKey(Restaurant,on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.restaurant.restorent_name}/{self.jour_semaine}"
    
    def save(self, *agrs, **kwargs):
        self.numero=NumeroGenMenu()
        super(Menu, self).save(*agrs, **kwargs)

#6
class Ingredient(models.Model):
    id=models.PositiveIntegerField(primary_key=True)
    nom_ingredient=models.CharField(max_length=255,null=False, blank=False, unique=True)
    description=models.TextField(blank=True,null=True)

    def __str__(self):
        return self.nom_ingredient


#7
class Plat(models.Model):
    id=models.PositiveIntegerField(primary_key=True)
    nom_plat=models.CharField(max_length=255,null=False, blank=False, unique=True)
    description=models.TextField(blank=True,null=True)
    image_plat=models.ImageField(upload_to="plat_img", blank=True, null=True)
    recette=models.TextField(blank=True,null=True)
    ingredients=models.ManyToManyField(Ingredient, null=True)

    def __str__(self):
        return self.nom_plat


#8
class PlatMenu(models.Model):
    id=models.PositiveIntegerField(primary_key=True)
    plat=models.ForeignKey(Plat,on_delete=models.CASCADE)
    menu=models.ForeignKey(Menu,on_delete=models.CASCADE)
    prix=models.IntegerField(default=1000)
    quantite=models.IntegerField(default=1)
    unite_quantite=models.CharField(max_length=255,default="plat")

    def __str__(self):
        return f"{self.menu.restaurant.restorent_name}({self.menu.jour_semaine}) : {self.plat.nom_plat}"


def NumeroGenMenu():
        taille=20
        while True:
            numero=''.join(random.choices(string.ascii_uppercase, k=taille))
            if Menu.objects.filter(numero=numero).count()==0:
                break
        return numero  


def NumeroGenCommande():
        taille=20
        while True:
            numero=''.join(random.choices(string.ascii_uppercase, k=taille))
            if Commande.objects.filter(numero=numero).count()==0:
                break
        return numero  
#9
class Commande(models.Model):
    STATUS=[
        ("En cours","En cours"),
        ("Validée","Validée"),
        ("Annulée","Annulée"),
    ]
    numero=models.CharField(max_length=20, blank=False)
    status=models.CharField(choices=STATUS, max_length=10, blank=False)
    date_commande=models.DateTimeField(default=now())
    utilisateur=models.ForeignKey(Simple_User,on_delete=models.CASCADE)
    restaurant=models.ForeignKey(Restaurant,on_delete=models.CASCADE)
    plat=models.ForeignKey(Plat,on_delete=models.CASCADE)
    quantite=models.IntegerField(default=1)

    def save(self, *agrs, **kwargs):
        self.numero=NumeroGenCommande()
        super(Commande, self).save(*agrs, **kwargs)
    def __str__(self):
        return self.numero
    
class ApreciationUser(models.Model):
    START=[
        ("0",0),
        ("1",1),
        ("2",2),
        ("3",3),
        ("4",4),
        ("5",5),
    ]
    nb_etoile=models.IntegerField(choices=START)
    utilisateur=models.ForeignKey(Simple_User,on_delete=models.CASCADE)
    plat=models.ForeignKey(PlatMenu,on_delete=models.CASCADE)

    def __str__(self):
        return str(self.nb_etoile)
    
class RechercherPlat(models.Model):
    numero=models.CharField(max_length=20,null=True, blank=True)
    date_recherche=models.DateTimeField(default=now())
    resultat=models.CharField(max_length=255, blank=True)
    user=models.ForeignKey(User,on_delete=models.CASCADE)

    def __str__(self):
        return self.numero
    
    def save(self, *agrs, **kwargs):
        self.numero=NumeroGenRecherche()
        user = kwargs.pop('user', None)
        if user is not None:
            self.user=user
        super(RechercherPlat, self).save(*agrs, **kwargs)

def NumeroGenRecherche():
        taille=20
        while True:
            numero=''.join(random.choices(string.ascii_uppercase, k=taille))
            if Menu.objects.filter(numero=numero).count()==0:
                break
        return numero

class RechercherParDescription(RechercherPlat):
    texte_description=models.TextField(blank=False, null=False)

    def save(self, *agrs, **kwargs):
        #self.resultat=model_prediction(self.texte_description)
        user = kwargs.pop('user', None)
        resultat = kwargs.pop('resultat', None)
        if user is not None:
            self.user=user
        if resultat is not None:
            self.resultat=resultat
        super(RechercherParDescription, self).save(*agrs, **kwargs)

class RechercherParImage(RechercherPlat):
    image=models.ImageField(upload_to="recherche_img",blank=False, null=False)


    def save(self, *agrs, **kwargs):
        #self.resultat=tfod_prediction(self.texte_description)
        user = kwargs.pop('user', None)
        if user is not None:
            super().save(user=user)
        super(RechercherParImage, self).save(*agrs, **kwargs)

class PlatHealthPB(models.Model):
    plat=models.ForeignKey(Plat, on_delete=models.CASCADE)
    health_pb=models.ForeignKey(Health_Problem, on_delete=models.CASCADE)