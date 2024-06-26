import random
import string
from django.db import models
from django.contrib.auth.models import AbstractUser
from django.utils.timezone import now
from django.contrib.auth.models import User
import geocoder
from decouple import config


class Country(models.Model):
    name = models.CharField(max_length=50, unique=True)

    def __str__(self):
        return self.name


class City(models.Model):
    name = models.CharField(max_length=50)
    country = models.ForeignKey(Country, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.name}({self.country})"

class Quartier(models.Model):
    name = models.CharField(max_length=50)
    city = models.ForeignKey(City, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.name}({self.city})"

class Restaurant(models.Model):

    account=models.OneToOneField(User, on_delete=models.CASCADE)

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
        return f"{self.restorent_name}, {self.quartier}"      


def NumeroGen():
        taille=20
        while True:
            numero=''.join(random.choises(string.ascii_uppercase, k=taille))
            if Menu.objects.filter(numero=numero).count()==0:
                break
        return numero   

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
    numero=models.CharField(max_length=20,null=False, blank=False, unique=True)
    jour_semaine=models.CharField(max_length=10,choices=JOURS,null=False, blank=False)
    restaurant=models.ForeignKey(Restaurant,on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.restaurant.restorent_name}/{self.jour_semaine}"

    def save(self, *agrs, **kwargs):
        self.numero=NumeroGen()
        super(Menu, self).save(*agrs, **kwargs)


class Ingredient(models.Model):
    nom_ingredient=models.CharField(max_length=255,null=False, blank=False, unique=True)
    description=models.TextField(blank=True,null=True)

    def __str__(self):
        return self.nom_ingredient

class Plat(models.Model):
    nom_plat=models.CharField(max_length=255,null=False, blank=False, unique=True)
    description=models.TextField(blank=True,null=True)
    image_plat=models.ImageField(upload_to="plat_img", blank=True, null=True)
    recette=models.TextField(blank=True,null=True)
    ingredients=models.ManyToManyField(Ingredient, null=True)
    

    def __str__(self):
        return self.nom_plat


class PlatMenu(models.Model):
    plat=models.ForeignKey(Plat,on_delete=models.CASCADE)
    menu=models.ForeignKey(Menu,on_delete=models.CASCADE)
    prix=models.IntegerField(default=1000)
    quantite=models.IntegerField(default=1)
    unite_quantite=models.CharField(max_length=255,default="plat")
    nb_etoile=models.IntegerField(default=0)

    def __str__(self):
        return f"{self.menu.restaurant.restorent_name}({self.menu.jour_semaine}) : {self.plat.nom_plat}"
