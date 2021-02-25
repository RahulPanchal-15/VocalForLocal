from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.forms import inlineformset_factory
from django.contrib.auth.forms import UserCreationForm

from django.contrib.auth import authenticate, login, logout
from django.contrib import messages

from django.contrib.auth.decorators import login_required

from datetime import datetime
#Create your views here.
from .models import Customer,Post
from .forms import CreateUserForm
from .forms import CreatePost,ProfileForm


def home(request):
	return render(request,'main/home.html',context={})

def profile(request):
	print("IN")
	if request.method == "POST":
		form = ProfileForm(request.POST)
		if form.is_valid():
			print("FORM IS VALID")
			n = form.cleaned_data["u_name"]
			ph = form.cleaned_data["phone"]
			e = form.cleaned_data["email"]
			ct = form.cleaned_data["city"]
			p = Customer(id = request.user.id, name=n, phone=ph, email=e , city = ct)
			p.save()
			print("SAVED")
	form = ProfileForm()
	return render(request,'main/profile.html',context={'form':form})

def upload(request):
	if request.method == "POST":
		form = CreatePost(request.POST or None, request.FILES or None)
		if form.is_valid():
			na = form.cleaned_data["name"]
			note = form.cleaned_data["note"]
			ph = form.cleaned_data["image"]
			ct = form.cleaned_data["category"]
			u = request.user.id
			print("UID : ",u)
			p = Post(name=na,note=note,user=Customer.objects.get(id=u),date_created=datetime.now().strftime("%H:%M:%S"),category=ct,photo = ph)
			p.save()
	form = CreatePost()
	return render(request,'main/upload.html',context={'form':form})

def registerPage(request):
	if request.user.is_authenticated:
		return redirect('home')
	else:
		form = CreateUserForm()
		if request.method == 'POST':
			form = CreateUserForm(request.POST)
			if form.is_valid():
				form.save()
				user = form.cleaned_data.get('username')
				messages.success(request, 'Account was created for ' + user)
				return redirect('login')
		
		context = {'form':form}
		return render(request, 'main/register.html', context)

def loginPage(request):
	if request.user.is_authenticated:
		return redirect('home')
	else:
		if request.method == 'POST':
			username = request.POST.get('username')
			password =request.POST.get('password')

			user = authenticate(request, username=username, password=password)

			if user is not None:
				login(request, user)
				return redirect('home')
			else:
				messages.info(request, 'Username OR password is incorrect')
		context = {}
		return render(request, 'main/login.html', context)

def logoutUser(request):
	logout(request)
	return redirect('login')
