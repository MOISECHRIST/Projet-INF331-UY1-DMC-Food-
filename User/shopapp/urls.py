from django.urls import path, include
from rest_framework import routers
from .views import *

router = routers.DefaultRouter()
router.register("Country", CountryViewSet)
router.register("City", CityViewSet)
router.register("Quartier", QuartierViewSet)
router.register("Restaurant", RestaurantViewSet)
router.register("Menu", MenuViewSet)
router.register("PlatMenu", PlatMenuViewSet)
router.register("Plat", PlatViewSet)
router.register("Ingredient", IngredientViewSet)
router.register("Commande", CommandeViewSet)
router.register("ApreciationUser",ApreciationUserViewSet)
router.register("RechercheParDescription",RechercherParDescriptionViewSet)
router.register("RechercheParImage",RechercherParImageViewSet)