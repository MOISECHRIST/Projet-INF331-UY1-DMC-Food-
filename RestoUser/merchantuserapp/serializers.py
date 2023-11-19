from rest_framework import serializers
from merchantuserapp.models import *
from django.contrib.auth.models import User


class RestaurantSerializer(serializers.ModelSerializer):
    class Meta:
        model = Restaurant
        fields = "__all__"

class UserSerializer(serializers.ModelSerializer):

    profile=RestaurantSerializer(source='restaurant')

    class Meta:
        model=User
        fields = ("id","username","first_name","last_name","email", 'profile')

class CountrySerializer(serializers.ModelSerializer):
    class Meta:
        model = Country
        fields = "__all__"


class CitySerializer(serializers.ModelSerializer):
    class Meta:
        model = City
        fields = "__all__"


class QuartierSerializer(serializers.ModelSerializer):
    class Meta:
        model = Quartier
        fields = "__all__"


class MenuSerializer(serializers.ModelSerializer):
    class Meta:
        model = Menu
        fields = "__all__"


class PlatSerializer(serializers.ModelSerializer):
    class Meta:
        model = Plat
        fields = "__all__"



class PlatMenuSerializer(serializers.ModelSerializer):
    class Meta:
        model = PlatMenu
        fields = "__all__"



class IngredientSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ingredient
        fields = "__all__"

