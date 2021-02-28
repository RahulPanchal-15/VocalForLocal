from django.urls import path
from . import views

urlpatterns = [
    path('home/', views.home,name="home"),
    path('profile/',views.profile,name="profile"),
    path('login/', views.loginPage, name="login"),  
	path('logout/', views.logoutUser, name="logout"),
    path('register/', views.registerPage, name="register"),
    path('upload/',views.upload,name="upload"),
    path('about/', views.about,name="about"),
]