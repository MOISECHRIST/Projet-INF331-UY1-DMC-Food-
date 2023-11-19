from django.contrib import admin
from merchantuserapp.models import *
from import_export.admin import ImportExportModelAdmin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User

@admin.register(Country)
class CountryAdmin(ImportExportModelAdmin):
    list_display = ("name",)


@admin.register(City)
class CityAdmin(ImportExportModelAdmin):
    list_display = ("name",)


@admin.register(Quartier)
class QuartierAdmin(ImportExportModelAdmin):
    list_display = ("name", "city")


admin.site.register(Menu)


admin.site.register(Plat)


admin.site.register(PlatMenu)


admin.site.register(Ingredient)


class RestaurantInline(admin.StackedInline):
    model=Restaurant

class RestaurantUserAdmin(UserAdmin):
    inlines=(RestaurantInline, )

admin.site.unregister(User)

admin.site.register(User, RestaurantUserAdmin)