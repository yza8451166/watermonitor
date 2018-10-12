"""watermonitor URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
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
from django.urls import path
from watermonito import views
urlpatterns = [
    path('admin/', admin.site.urls),
    path('login/',views.login),
    path(r'check_code',views.check_code),
    path(r'index.html',views.index),
    path('getvalue',views.getvalue),
    path('history-data-show.html',views.history_data_show),
    path('history-data-json.html',views.history_data_json),



]
