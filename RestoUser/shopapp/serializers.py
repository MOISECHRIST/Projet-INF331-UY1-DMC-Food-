from rest_framework import serializers
from .models import *



class SimpleUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = SimpleUser
        fields = "__all__"

class CommandeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Commande
        fields = "__all__"

class ApreciationUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = ApreciationUser
        fields = "__all__"


