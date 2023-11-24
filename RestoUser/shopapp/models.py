from django.db import models
from merchantuserapp.models import *
from django.utils.timezone import now
# Create your models here.

class SimpleUser(models.Model):
    GENDER = [
        ("-", "None"),
        ("f", "Female"),
        ("m", "Male"),
    ]

    id=models.PositiveIntegerField(primary_key=True, null=False, blank=False)
    username=models.CharField(max_length=150, unique=True)
    first_name=models.CharField(max_length=250)
    last_name=models.CharField(max_length=250)
    email=models.EmailField(blank=True)
    phone_number = models.CharField(max_length=255, blank=True)
    image = models.ImageField(upload_to="user_img", blank=True, null=True)
    gender = models.CharField(max_length=1, choices=GENDER, null=False, blank=False)

class Commande(models.Model):
    STATUS=[
        ("En cours","En cours"),
        ("Validée","Validée"),
        ("Annulée","Annulée"),
    ]
    id=models.PositiveIntegerField(primary_key=True, null=False, blank=False)
    numero=models.CharField(max_length=20, blank=False)
    status=models.CharField(choices=STATUS, max_length=10, blank=False)
    date_commande=models.DateTimeField(default=now())
    utilisateur=models.ForeignKey(SimpleUser,on_delete=models.CASCADE)
    restaurant=models.ForeignKey(Restaurant,on_delete=models.CASCADE)
    plat=models.ForeignKey(Plat,on_delete=models.CASCADE)