from django.contrib import admin
from userapp.models import *
from import_export.admin import ImportExportModelAdmin


@admin.register(Health_Problem)
class Health_ProblemAdmin(ImportExportModelAdmin):
    list_display = ("name", "description")


admin.site.register(Simple_User)
