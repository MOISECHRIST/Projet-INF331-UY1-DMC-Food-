from rest_framework import serializers
from .models import *
from django.contrib.auth.models import User

#1
class RestaurantSerializer(serializers.ModelSerializer):
    class Meta:
        model = Restaurant
        fields = "__all__"
#2
class CountrySerializer(serializers.ModelSerializer):
    class Meta:
        model = Country
        fields = "__all__"

#3
class CitySerializer(serializers.ModelSerializer):
    class Meta:
        model = City
        fields = "__all__"

#4
class QuartierSerializer(serializers.ModelSerializer):
    class Meta:
        model = Quartier
        fields = "__all__"

#5
class MenuSerializer(serializers.ModelSerializer):
    class Meta:
        model = Menu
        fields = "__all__"

#6
class PlatSerializer(serializers.ModelSerializer):
    class Meta:
        model = Plat
        fields = "__all__"


#7
class PlatMenuSerializer(serializers.ModelSerializer):
    class Meta:
        model = PlatMenu
        fields = "__all__"


#8
class IngredientSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ingredient
        fields = "__all__"

#9
class CommandeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Commande
        fields = "__all__"