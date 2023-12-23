from rest_framework.response import Response
from rest_framework import viewsets, status
from userapp.serializers import Health_ProblemSerializer, Simple_UserSerializer,UserSerializer
from userapp.models import *
from rest_framework.permissions import IsAuthenticated
from django.contrib.auth.models import User
from userapp.producer import publish

class MeViewSet(viewsets.ViewSet):
    #permission_classes = (IsAuthenticated,)
    def list(self,request):
        user=User.objects.get(username=request.user)
        user_data=UserSerializer(user).data
        return Response(user_data)

class Health_ProblemViewSet(viewsets.ModelViewSet):
    queryset = Health_Problem.objects.all()
    #permission_classes = (IsAuthenticated,)
    serializer_class = Health_ProblemSerializer
    filterset_fields = [
        "name",
    ]
    search_fields = ["name"]

    def list(self, request):
        objects=Health_Problem.objects.all()
        data=Health_ProblemSerializer(objects, many=True).data
        return Response(data)
    
    def retrieve(self,request,pk):
        object=Health_Problem.objects.get(id=pk)
        data=Health_ProblemSerializer(object).data
        return Response(data)
    
    def create(self,request):
        serializer=Health_ProblemSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
    
    def update(self,request,pk):
        object=Health_Problem.objects.get(id=pk)
        serializer=Health_ProblemSerializer(instance=object, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
    
    def partial_update(self,request,pk):
        object=Health_Problem.objects.get(id=pk)
        serializer=Health_ProblemSerializer(instance=object, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
    
    def destroy(self,request,pk):
        object=Health_Problem.objects.get(id=pk)
        object.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


class Simple_UserViewSet(viewsets.ModelViewSet):
    queryset = Simple_User.objects.all()
    #permission_classes = (IsAuthenticated,)
    serializer_class = Simple_UserSerializer
    filterset_fields = ["health_problem"]
    search_fields = ["username"]

    def list(self, request):
        objects=Simple_User.objects.all()
        data=Simple_UserSerializer(objects, many=True).data
        return Response(data)
    
    def retrieve(self,request,pk):
        object=Simple_User.objects.get(id=pk)
        data=Simple_UserSerializer(object).data
        return Response(data)
    
    def create(self,request):
        serializer=Simple_UserSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        publish("Simple_User_created",serializer.data)
        return Response(serializer.data)
    
    def update(self,request,pk):
        object=Simple_User.objects.get(id=pk)
        serializer=Simple_UserSerializer(instance=object, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        publish("Simple_User_updated",serializer.data)
        return Response(serializer.data)
    
    def partial_update(self,request,pk):
        object=Simple_User.objects.get(id=pk)
        serializer=Simple_UserSerializer(instance=object, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        publish("Simple_User_partial_updated",serializer.data)
        return Response(serializer.data)
    
    def destroy(self,request,pk):
        object=Simple_User.objects.get(id=pk)
        object.delete()
        publish("Simple_User_deleted",pk)
        return Response(status=status.HTTP_204_NO_CONTENT)