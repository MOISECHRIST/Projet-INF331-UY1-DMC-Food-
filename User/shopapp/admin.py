from django.contrib import admin
from .models import *
#1
admin.site.register(Country)
#2
admin.site.register(City)
#3
admin.site.register(Quartier)
#4
admin.site.register(Menu)
#5
admin.site.register(Plat)
#6
admin.site.register(PlatMenu)
#7
admin.site.register(Ingredient)
#8
admin.site.register(Restaurant)
#9
admin.site.register(Commande)
#10
admin.site.register(ApreciationUser)
#11
admin.site.register(RechercherPlat)
#12
admin.site.register(RechercherParDescription)
#13
admin.site.register(RechercherParImage)

