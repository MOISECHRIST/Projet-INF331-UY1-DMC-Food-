from rest_framework import serializers
from userapp.models import *


class Health_ProblemSerializer(serializers.ModelSerializer):
    class Meta:
        model = Health_Problem
        fields = "__all__"


class Simple_UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = Simple_User
        fields = "__all__"
