from django.db import models
from merchantuserapp.models import *
from django.utils.timezone import now
# Create your models here.

class SimpleUser(models.Model):
    id=models.PositiveIntegerField(primary_key=True, null=False, blank=False)
    email=models.EmailField(blank=True)
    phone_number = models.CharField(max_length=255, blank=True)

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

class ApreciationUser(models.Model):
    START=[
        ("0",0),
        ("1",1),
        ("2",2),
        ("3",3),
        ("4",4),
        ("5",5),
    ]
    id=models.PositiveIntegerField(primary_key=True, null=False, blank=False)
    nb_etoile=models.IntegerField(choices=START)
    utilisateur=models.ForeignKey(SimpleUser,on_delete=models.CASCADE)
    plat=models.ForeignKey(PlatMenu,on_delete=models.CASCADE)