from django.urls import path, include
from rest_framework import routers
from .views import *

router = routers.DefaultRouter()
router.register("Country", CountryViewSet)
router.register("City", CityViewSet)
router.register("Restorent", RestorentViewSet)
router.register("MerchantUser", Merchant_UserViewSet)
