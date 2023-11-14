from django.contrib import admin
from merchantuserapp.models import *
from import_export.admin import ImportExportModelAdmin


@admin.register(Country)
class CountryAdmin(ImportExportModelAdmin):
    list_display = ("name",)


@admin.register(City)
class CityAdmin(ImportExportModelAdmin):
    list_display = ("name",)


@admin.register(Restorent)
class RestorentAdmin(ImportExportModelAdmin):
    list_display = ("name", "city", "longitude", "latitude")


admin.site.register(Merchant_User)
