from rest_framework import serializers
from userapp.models import *
from django.contrib.auth.models import User


class Simple_UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = Simple_User
        fields = "__all__"

class UserSerializer(serializers.ModelSerializer):

    profile=Simple_UserSerializer(source='simple_user')

    class Meta:
        model=User
        fields = ("id","username","first_name","last_name","email","profile")


class Health_ProblemSerializer(serializers.ModelSerializer):
    class Meta:
        model = Health_Problem
        fields = "__all__"

