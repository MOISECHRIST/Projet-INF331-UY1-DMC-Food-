from rest_framework.response import Response
from rest_framework import viewsets
from userapp.serializers import Health_ProblemSerializer, Simple_UserSerializer,UserSerializer
from userapp.models import *
from rest_framework.permissions import IsAuthenticated
from django.contrib.auth.models import User


class MeViewSet(viewsets.ViewSet):
    
    permission_classes = (IsAuthenticated,)
    
    def list(self,request):
        user=User.objects.get(username=request.user)
        user_data=UserSerializer(user).data
        return Response(user_data)

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
    filterset_fields = ["health_problem"]
    search_fields = ["username"]
