from rest_framework.response import Response
from rest_framework import viewsets, status
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
    ApreciationUserSerializer,
    RechercherParDescriptionSerializer,
    RechercherParImageSerializer
)
from .models import *
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from shopapp.producer import publish




class CountryViewSet(viewsets.ModelViewSet):
    queryset = Country.objects.all()
    serializer_class = CountrySerializer
    #permission_classes = (IsAuthenticated,)
    filterset_fields = ["name"]
    search_fields = ["name"]

    def list(self, request):
        countries=Country.objects.all()
        data=CountrySerializer(countries, many=True).data
        return Response(data)
    
    def retrieve(self,request,pk):
        country=Country.objects.get(id=pk)
        data=CountrySerializer(country).data
        return Response(data)
    
    def create(self,request):
        serializer=CountrySerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
    
    def update(self,request,pk):
        country=Country.objects.get(id=pk)
        serializer=CountrySerializer(instance=country, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
    
    def partial_update(self,request,pk):
        country=Country.objects.get(id=pk)
        serializer=CountrySerializer(instance=country, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
    
    def destroy(self,request,pk):
        country=Country.objects.get(id=pk)
        country.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


class CityViewSet(viewsets.ModelViewSet):
    queryset = City.objects.all()
    #permission_classes = (IsAuthenticated,)
    serializer_class = CitySerializer
    filterset_fields = ["name", "country"]
    search_fields = ["name"]

    def list(self, request):
        city=City.objects.all()
        data=CitySerializer(city, many=True).data
        return Response(data)
    
    def retrieve(self,request,pk):
        city=City.objects.get(id=pk)
        data=CitySerializer(city).data
        return Response(data)
    
    def create(self,request):
        serializer=CitySerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
    
    def update(self,request,pk):
        city=City.objects.get(id=pk)
        serializer=CitySerializer(instance=city, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
    
    def partial_update(self,request,pk):
        city=City.objects.get(id=pk)
        serializer=CitySerializer(instance=city, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
    
    def destroy(self,request,pk):
        city=City.objects.get(id=pk)
        city.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

class QuartierViewSet(viewsets.ModelViewSet):
    queryset = Quartier.objects.all()
    #permission_classes = (IsAuthenticated,)
    serializer_class = QuartierSerializer
    filterset_fields = ["name"]
    search_fields = ["name"]

    def list(self, request):
        quartiers=Quartier.objects.all()
        data=QuartierSerializer(quartiers, many=True).data
        return Response(data)
    
    def retrieve(self,request,pk):
        quartier=Quartier.objects.get(id=pk)
        data=QuartierSerializer(quartier).data
        return Response(data)
    
    def create(self,request):
        serializer=QuartierSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
    
    def update(self,request,pk):
        quartier=Quartier.objects.get(id=pk)
        serializer=QuartierSerializer(instance=quartier, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
    
    def partial_update(self,request,pk):
        quartier=Quartier.objects.get(id=pk)
        serializer=QuartierSerializer(instance=quartier, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
    
    def destroy(self,request,pk):
        quartier=Quartier.objects.get(id=pk)
        quartier.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
    

class RestaurantViewSet(viewsets.ModelViewSet):
    queryset = Restaurant.objects.all()
    #permission_classes = (IsAuthenticated,)
    serializer_class = RestaurantSerializer
    filterset_fields = ["restorent_name", "quartier", "latitude", "longitude"]
    search_fields = ["restorent_name"]

    def list(self, request):
        restaurant=Restaurant.objects.all()
        data=RestaurantSerializer(restaurant, many=True).data
        return Response(data)
    
    def retrieve(self,request,pk):
        restaurant=Restaurant.objects.get(id=pk)
        data=RestaurantSerializer(restaurant).data
        return Response(data)
    
    def create(self,request):
        serializer=RestaurantSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
    
    def update(self,request,pk):
        restaurant=Restaurant.objects.get(id=pk)
        serializer=RestaurantSerializer(instance=restaurant, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
    
    def partial_update(self,request,pk):
        restaurant=Restaurant.objects.get(id=pk)
        serializer=RestaurantSerializer(instance=restaurant, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
    
    def destroy(self,request,pk):
        restaurant=Restaurant.objects.get(id=pk)
        restaurant.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


class MenuViewSet(viewsets.ModelViewSet):
    queryset = Menu.objects.all()
    #permission_classes = (IsAuthenticated,)
    serializer_class = MenuSerializer
    filterset_fields = ["restaurant", "jour_semaine"]
    search_fields = ["restaurant"]

    def list(self, request):
        objects=Menu.objects.all()
        data=MenuSerializer(objects, many=True).data
        return Response(data)
    
    def retrieve(self,request,pk):
        object=Menu.objects.get(id=pk)
        data=MenuSerializer(object).data
        return Response(data)
    
    def create(self,request):
        serializer=MenuSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
    
    def update(self,request,pk):
        object=Menu.objects.get(id=pk)
        serializer=MenuSerializer(instance=object, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
    
    def partial_update(self,request,pk):
        object=Menu.objects.get(id=pk)
        serializer=MenuSerializer(instance=object, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
    
    def destroy(self,request,pk):
        object=Menu.objects.get(id=pk)
        object.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
    

class PlatMenuViewSet(viewsets.ModelViewSet):
    queryset = PlatMenu.objects.all()
    #permission_classes = (IsAuthenticated,)
    serializer_class = PlatMenuSerializer
    filterset_fields = ["plat", "menu","prix","quantite","unite_quantite"]
    search_fields = ["restaurant"]

    def list(self, request):
        objects=PlatMenu.objects.all()
        data=PlatMenuSerializer(objects, many=True).data
        return Response(data)
    
    def retrieve(self,request,pk):
        object=PlatMenu.objects.get(id=pk)
        data=PlatMenuSerializer(object).data
        return Response(data)
    
    def create(self,request):
        serializer=PlatMenuSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
    
    def update(self,request,pk):
        object=PlatMenu.objects.get(id=pk)
        serializer=PlatMenuSerializer(instance=object, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
    
    def partial_update(self,request,pk):
        object=PlatMenu.objects.get(id=pk)
        serializer=PlatMenuSerializer(instance=object, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
    
    def destroy(self,request,pk):
        object=PlatMenu.objects.get(id=pk)
        object.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


class IngredientViewSet(viewsets.ModelViewSet):
    queryset = Ingredient.objects.all()
    #permission_classes = (IsAuthenticated,)
    serializer_class = IngredientSerializer
    filterset_fields = ["plat", "nom_ingredient"]
    search_fields = ["nom_ingredient"]

    def list(self, request):
        objects=Ingredient.objects.all()
        data=IngredientSerializer(objects, many=True).data
        return Response(data)
    
    def retrieve(self,request,pk):
        object=Ingredient.objects.get(id=pk)
        data=IngredientSerializer(object).data
        return Response(data)
    
    def create(self,request):
        serializer=IngredientSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
    
    def update(self,request,pk):
        object=Ingredient.objects.get(id=pk)
        serializer=IngredientSerializer(instance=object, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
    
    def partial_update(self,request,pk):
        object=Ingredient.objects.get(id=pk)
        serializer=IngredientSerializer(instance=object, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
    
    def destroy(self,request,pk):
        object=Ingredient.objects.get(id=pk)
        object.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

class PlatViewSet(viewsets.ModelViewSet):
    queryset = Plat.objects.all()
    #permission_classes = (IsAuthenticated,)
    serializer_class = PlatSerializer
    filterset_fields = ["nom_plat","description"]
    search_fields = ["nom_plat"]

    def list(self, request):
        objects=Plat.objects.all()
        data=PlatSerializer(objects, many=True).data
        return Response(data)
    
    def retrieve(self,request,pk):
        object=Plat.objects.get(id=pk)
        data=PlatSerializer(object).data
        return Response(data)
    
    def create(self,request):
        serializer=PlatSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
    
    def update(self,request,pk):
        object=Plat.objects.get(id=pk)
        serializer=PlatSerializer(instance=object, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
    
    def partial_update(self,request,pk):
        object=Plat.objects.get(id=pk)
        serializer=PlatSerializer(instance=object, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
    
    def destroy(self,request,pk):
        object=Plat.objects.get(id=pk)
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
        publish("Commande_partialUpdate",serializer.data)
        return Response(serializer.data)
    
    def destroy(self,request,pk):
        object=Commande.objects.get(id=pk)
        object.delete()
        publish("Commande_destroy",pk)
        return Response(status=status.HTTP_204_NO_CONTENT)

class ApreciationUserViewSet(viewsets.ModelViewSet):
    queryset = ApreciationUser.objects.all()
    serializer_class = ApreciationUserSerializer
    #permission_classes = (IsAuthenticated,)
    filterset_fields = ["utilisateur","plat"]
    search_fields = ["nb_etoile"]

    def list(self, request):
        objects=ApreciationUser.objects.all()
        data=ApreciationUserSerializer(objects, many=True).data
        return Response(data)
    
    def retrieve(self,request,pk):
        object=ApreciationUser.objects.get(id=pk)
        data=ApreciationUserSerializer(object).data
        return Response(data)
    
    def create(self,request):
        serializer=ApreciationUserSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        publish("ApreciationUser_created",serializer.data)
        return Response(serializer.data)
    
    def update(self,request,pk):
        object=ApreciationUser.objects.get(id=pk)
        serializer=ApreciationUserSerializer(instance=object, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        publish("ApreciationUser_updated",serializer.data)
        return Response(serializer.data)
    
    def partial_update(self,request,pk):
        object=ApreciationUser.objects.get(id=pk)
        serializer=ApreciationUserSerializer(instance=object, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        publish("ApreciationUser_partialUpdate",serializer.data)
        return Response(serializer.data)
    
    def destroy(self,request,pk):
        object=ApreciationUser.objects.get(id=pk)
        object.delete()
        publish("ApreciationUser_destroy",pk)
        return Response(status=status.HTTP_204_NO_CONTENT)

class RechercherParDescriptionViewSet(viewsets.ModelViewSet):
    queryset = RechercherParDescription.objects.all()
    serializer_class = RechercherParDescriptionSerializer
    #permission_classes = (IsAuthenticated,)
    filterset_fields = ["user","date_recherche","resultat"]
    search_fields = ["numero"]

    def create(self,request):
        serializer=RechercherParDescriptionSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save(user=request.user)
        return Response(serializer.data)

class RechercherParImageViewSet(viewsets.ModelViewSet):
    queryset = RechercherParImage.objects.all()
    serializer_class = RechercherParImageSerializer
    #permission_classes = (IsAuthenticated,)
    filterset_fields = ["user","date_recherche","resultat"]
    search_fields = ["numero"]

    def create(self,request):
        serializer=RechercherParImageSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save(user=request.user)
        return Response(serializer.data)