from django.contrib import admin
from django.urls import path
# from post.views import update, detail, delete, index, create, index
from .views import *




urlpatterns = [
    path('index/', index, name='index'),
    path('create/', create, name='create'),
    path('update/', update, name='update'),
# path('update/<int:id>/', update, name='update'),
    path('detail/', detail, name='detail'),
    path('delete/', delete, name='delete'),
]