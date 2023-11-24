from rest_framework.response import Response
from rest_framework import viewsets
from shopapp.serializers import (
    SimpleUserSerializer,
    CommandeSerializer,
)
from .models import *
from rest_framework.permissions import IsAuthenticated




class SimpleUserViewSet(viewsets.ModelViewSet):
    queryset = SimpleUser.objects.all()
    serializer_class = SimpleUserSerializer
    permission_classes = (IsAuthenticated,)
    filterset_fields = ["username", "first_name", "last_name"]
    search_fields = ["username"]

class CommandeViewSet(viewsets.ModelViewSet):
    queryset = Commande.objects.all()
    serializer_class = CommandeSerializer
    permission_classes = (IsAuthenticated,)
    filterset_fields = ["status","date_commande","utilisateur","restaurant","plat"]
    search_fields = ["status"]