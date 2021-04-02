from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.forms import inlineformset_factory
from django.contrib.auth.forms import UserCreationForm

from django.contrib.auth import authenticate, login, logout
from django.contrib import messages

from django.contrib.auth.decorators import login_required

from datetime import datetime
#Create your views here.
from django.db import models
from .models import Customer,Post
from .forms import CreateUserForm
from .forms import CreatePost,ProfileForm

from. forms import states
import json 

def home(request):
	posts = Post.objects.all()
	locat = None
	avail = None
	category = None
	if request.method == "POST" :
		locat = request.POST['location']
		category = request.POST['category_option']
		avail = request.POST['availability_option']
		
		# print(category)
		# print(avail)
		# print(locat)

		qs1 = Post.objects.all()
		qs2 = Post.objects.all()
		qs3 = Post.objects.all()
		if(category!='0'):
			qs1 = qs1.filter(category = category)
			# print(qs1)
		if(avail!='0'):
			qs2 = qs2.filter(availability = avail)
			# print(qs2)
		if(locat!='0'):
			# print(states[int(locat)-1])
			qs3 = qs3.filter(location = states[int(locat)-1])
			# print(qs3)
		qs4 = qs1.intersection(qs2,qs3)
		print(qs4)
		return render(request,'main/home.html',context={'posts':qs4})
	return render(request,'main/home.html',context={'posts':posts})


def search(request,key):
	# print(key)
	qs1 = Post.objects.filter(name__contains=key)
	# print(qs1)
	qs2 = Post.objects.filter(description__contains=key)
	# print(qs2)
	products_qs = qs1.union(qs2)
	print(products_qs)

	customer_qs = Customer.objects.filter(business_name__contains=key)
	print([x.business_name for x in customer_qs])

	context = {
		"products_qs":products_qs,
		"customer_qs":customer_qs
	}

	return render(request,'main/searchResult.html',context)


def about(request):
	return render(request,'main/about.html',context={})


def profile(request):
	if request.method == "POST":
		form = ProfileForm(request.POST)
		if form.is_valid():
			print("FORM IS VALID")
			n = form.cleaned_data["u_name"]
			ph = form.cleaned_data["phone"]
			e = form.cleaned_data["email"]
			st = form.cleaned_data["state"]
			pin = form.cleaned_data["postal_code"]
			ct = form.cleaned_data["city"]
			add = form.cleaned_data["address"]
			b_name = form.cleaned_data["business_name"]
			p = Customer(id = request.user.id, name=n, phone=ph, email=e , state = st, postal_code = pin, city = ct, address = add, business_name = b_name)
			p.save()
			print("SAVED")

		print("hello")
		values = request.POST.getlist('confirmation')
		print(values)
		if len(values) > 0:
			post_id = int(values[0])
			print("{}".format(post_id))
			post = Post.objects.get(p_id = post_id)
			post.delete()
			print("Delete Successful!")

	if(Customer.objects.filter(pk=request.user.id).exists()):
		user_profile = Customer.objects.get(id = request.user.id)
		user_posts = Post.objects.filter(owner = request.user.id)
		init_dict = {
			"u_name" : user_profile.name,
			"phone" : user_profile.phone, 
			"email" : request.user.email,
			"business_name" : user_profile.business_name,
			"state" : user_profile.state,
			"city" : user_profile.city,
			"postal_code" : user_profile.postal_code,
			"address" : user_profile.address,
		}
		form = ProfileForm(initial = init_dict)
		return render(request,'main/profile.html',context={'form':form, 'user_posts':user_posts, 'user_profile':user_profile })
	form = ProfileForm
	return render(request,'main/profile.html',context={'form':form})
	


def upload(request):
	if request.method == "POST":
		form = CreatePost(request.POST or None, request.FILES or None)
		if form.is_valid():
			na = form.cleaned_data["name"]
			note = form.cleaned_data["description"]
			ph = form.cleaned_data["image"]
			ct = form.cleaned_data["category"]
			try:
				u = Customer.objects.get(id=request.user.id)
			except Customer.DoesNotExist:
				form = ProfileForm
				return render(request,'main/profile.html',context={'form':form})
			avail = form.cleaned_data["availability"]
			p = Post(name=na,description=note,owner=u,business_name = u.business_name,date_created=datetime.now().strftime("%H:%M:%S"),category=ct,photo = ph,availability = avail,location = u.state)
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


def delete_post(request):
	post_id = request.GET.get('p_id', False)
	p = Post.objects.get(pk = post_id)
	context ={'post_id':p}
	return render(request,'main/delete.html',context)


def viewProfile(request):
	context = {}
	return render(request,'main/viewProfile.html',context)