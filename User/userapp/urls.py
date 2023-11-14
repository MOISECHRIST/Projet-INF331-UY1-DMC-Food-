from django.urls import path, include
from rest_framework import routers
from .views import *

router = routers.DefaultRouter()
router.register("HealthProblem", Health_ProblemViewSet)
router.register("SimpleUser", Simple_UserViewSet)
