from django.shortcuts import render
from rest_framework import viewsets
from merchantuserapp.serializers import (
    CitySerializer,
    CountrySerializer,
    Merchant_UserSerializer,
    RestorentSerializer,
)
from merchantuserapp.models import *
from rest_framework.permissions import IsAuthenticated


class CountryViewSet(viewsets.ModelViewSet):
    queryset = Country.objects.all()
    serializer_class = CountrySerializer
    permission_classes = (IsAuthenticated,)
    filterset_fields = ["name"]
    search_fields = ["name"]


class CityViewSet(viewsets.ModelViewSet):
    queryset = City.objects.all()
    permission_classes = (IsAuthenticated,)
    serializer_class = CitySerializer
    filterset_fields = ["name", "country"]
    search_fields = ["name"]


class RestorentViewSet(viewsets.ModelViewSet):
    queryset = Restorent.objects.all()
    permission_classes = (IsAuthenticated,)
    serializer_class = RestorentSerializer
    filterset_fields = ["name", "city", "latitude", "longitude"]
    search_fields = ["name"]


class Merchant_UserViewSet(viewsets.ModelViewSet):
    queryset = Merchant_User.objects.all()
    permission_classes = (IsAuthenticated,)
    serializer_class = Merchant_UserSerializer
    filterset_fields = ["username", "first_name", "last_name", "restorent"]
    search_fields = ["username"]
