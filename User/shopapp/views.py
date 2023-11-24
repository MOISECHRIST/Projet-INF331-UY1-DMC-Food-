from rest_framework.response import Response
from rest_framework import viewsets
from shopapp.serializers import (
    CitySerializer,
    CountrySerializer,
    IngredientSerializer,
    MenuSerializer,
    PlatMenuSerializer,
    QuartierSerializer,
    RestaurantSerializer,
    PlatSerializer,
    CommandeSerializer,
)
from .models import *
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

class QuartierViewSet(viewsets.ModelViewSet):
    queryset = Quartier.objects.all()
    permission_classes = (IsAuthenticated,)
    serializer_class = QuartierSerializer
    filterset_fields = ["name"]
    search_fields = ["name"]

class RestaurantViewSet(viewsets.ModelViewSet):
    queryset = Restaurant.objects.all()
    permission_classes = (IsAuthenticated,)
    serializer_class = RestaurantSerializer
    filterset_fields = ["restorent_name", "quartier", "latitude", "longitude"]
    search_fields = ["restorent_name"]


class MenuViewSet(viewsets.ModelViewSet):
    queryset = Menu.objects.all()
    permission_classes = (IsAuthenticated,)
    serializer_class = MenuSerializer
    filterset_fields = ["restaurant", "jour_semaine"]
    search_fields = ["restaurant"]


class PlatMenuViewSet(viewsets.ModelViewSet):
    queryset = PlatMenu.objects.all()
    permission_classes = (IsAuthenticated,)
    serializer_class = PlatMenuSerializer
    filterset_fields = ["plat", "menu","prix","quantite","unite_quantite"]
    search_fields = ["restaurant"]


class IngredientViewSet(viewsets.ModelViewSet):
    queryset = Ingredient.objects.all()
    permission_classes = (IsAuthenticated,)
    serializer_class = IngredientSerializer
    filterset_fields = ["plat", "nom_ingredient"]
    search_fields = ["nom_ingredient"]

class PlatViewSet(viewsets.ModelViewSet):
    queryset = Plat.objects.all()
    permission_classes = (IsAuthenticated,)
    serializer_class = PlatSerializer
    filterset_fields = ["nom_plat","description"]
    search_fields = ["nom_plat"]


class CommandeViewSet(viewsets.ModelViewSet):
    queryset = Commande.objects.all()
    permission_classes = (IsAuthenticated,)
    serializer_class = CommandeSerializer
    filterset_fields = ["numero","description"]
    search_fields = ["nom_plat"]