from rest_framework.response import Response
from rest_framework import viewsets, status
from shopapp.serializers import (
    SimpleUserSerializer,
    CommandeSerializer,
    ApreciationUserSerializer,
)
from .models import *
from rest_framework.permissions import IsAuthenticated
from shopapp.producer import publish

class SimpleUserViewSet(viewsets.ModelViewSet):
    queryset = SimpleUser.objects.all()
    serializer_class = SimpleUserSerializer
    #permission_classes = (IsAuthenticated,)
    filterset_fields = ["email", "phone_number"]
    search_fields = ["email"]

    def list(self, request):
        objects=SimpleUser.objects.all()
        data=SimpleUserSerializer(objects, many=True).data
        return Response(data)
    
    def retrieve(self,request,pk):
        object=SimpleUser.objects.get(id=pk)
        data=SimpleUserSerializer(object).data
        return Response(data)
    
    def create(self,request):
        serializer=SimpleUserSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
    
    def update(self,request,pk):
        object=SimpleUser.objects.get(id=pk)
        serializer=SimpleUserSerializer(instance=object, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
    
    def partial_update(self,request,pk):
        object=SimpleUser.objects.get(id=pk)
        serializer=SimpleUserSerializer(instance=object, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
    
    def destroy(self,request,pk):
        object=SimpleUser.objects.get(id=pk)
        object.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

class CommandeViewSet(viewsets.ModelViewSet):
    queryset = Commande.objects.all()
    serializer_class = CommandeSerializer
    #permission_classes = (IsAuthenticated,)
    filterset_fields = ["status","date_commande","utilisateur","restaurant","plat"]
    search_fields = ["status"]

    def list(self, request):
        objects=Commande.objects.all()
        data=CommandeSerializer(objects, many=True).data
        return Response(data)
    
    def retrieve(self,request,pk):
        object=Commande.objects.get(id=pk)
        data=CommandeSerializer(object).data
        return Response(data)
    
    def create(self,request):
        serializer=CommandeSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        publish("Commande_created",serializer.data)
        return Response(serializer.data)
    
    def update(self,request,pk):
        object=Commande.objects.get(id=pk)
        serializer=CommandeSerializer(instance=object, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        publish("Commande_updated",serializer.data)
        return Response(serializer.data)
    
    def partial_update(self,request,pk):
        object=Commande.objects.get(id=pk)
        serializer=CommandeSerializer(instance=object, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        publish("Commande_partial_updated",serializer.data)
        return Response(serializer.data)
    
    def destroy(self,request,pk):
        object=Commande.objects.get(id=pk)
        object.delete()
        publish("Commande_deleted",pk)
        return Response(status=status.HTTP_204_NO_CONTENT)

class ApreciationUserViewSet(viewsets.ViewSet):
    filterset_fields = ["utilisateur","plat"]
    search_fields = ["nb_etoile"]

    def list(self,request):
        object=ApreciationUser.objects.filter()
        data=ApreciationUserSerializer(object).data
        return Response(data)