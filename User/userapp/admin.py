from django.contrib import admin
from userapp.models import *
from import_export.admin import ImportExportModelAdmin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User

@admin.register(Health_Problem)
class Health_ProblemAdmin(ImportExportModelAdmin):
    list_display = ("name", "description")


class Simple_UserInline(admin.StackedInline):
    model=Simple_User

class RestaurantUserAdmin(UserAdmin):
    inlines=(Simple_UserInline, )

admin.site.unregister(User)

admin.site.register(User, RestaurantUserAdmin)
