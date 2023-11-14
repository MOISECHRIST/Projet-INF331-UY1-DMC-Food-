from django.shortcuts import render
from rest_framework import viewsets
from userapp.serializers import Health_ProblemSerializer, Simple_UserSerializer
from userapp.models import *
from rest_framework.permissions import IsAuthenticated


class Health_ProblemViewSet(viewsets.ModelViewSet):
    queryset = Health_Problem.objects.all()
    permission_classes = (IsAuthenticated,)
    serializer_class = Health_ProblemSerializer
    filterset_fields = [
        "name",
    ]
    search_fields = ["name"]


class Simple_UserViewSet(viewsets.ModelViewSet):
    queryset = Simple_User.objects.all()
    permission_classes = (IsAuthenticated,)
    serializer_class = Simple_UserSerializer
    filterset_fields = ["username", "first_name", "last_name", "health_problem"]
    search_fields = ["username"]
