"""
URL configuration for User project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from rest_framework import routers
from userapp.urls import router as userapp_router
from shopapp.urls import router as shopapp_router
from django.conf.urls.static import static
from . import settings
from .views import *

router = routers.DefaultRouter()
router.registry.extend(userapp_router.registry)
router_shop = routers.DefaultRouter()
router_shop.registry.extend(shopapp_router.registry)
urlpatterns = [
    #Frontend URLs
    path('', index, name="home"),
    path("logout/", logout_user,name='logout'),
    path("login/", login_user,name='login'),
    path("signup/", singup_view,name='signup'),
    path("edit_user/", edit_user_view,name='edit_user'),
    path("research/", research_view,name='research'),
    path("orders/", orders_view,name='orders'),
    
    #Admin URls
    path("admin/", admin.site.urls),

    #API URLs
    path("api/", include(router.urls)),
    path("api/shop/", include(router_shop.urls)),
    path("api/", include("dj_rest_auth.urls")),
    path("api/registration/", include("dj_rest_auth.registration.urls")),
] + static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
