from rest_framework import serializers
from merchantuserapp.models import *


class CountrySerializer(serializers.ModelSerializer):
    class Meta:
        model = Country
        fields = "__all__"


class CitySerializer(serializers.ModelSerializer):
    class Meta:
        model = City
        fields = "__all__"


class RestorentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Restorent
        fields = "__all__"


class Merchant_UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = Merchant_User
        fields = "__all__"
