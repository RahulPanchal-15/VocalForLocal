from django.forms import ModelForm
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django import forms

class CreateUserForm(UserCreationForm):
	class Meta:
		model = User
		fields = ['username', 'email', 'password1', 'password2']

class CreatePost(forms.Form):
	name = forms.CharField(label="name",max_length = 200)
	category = forms.CharField(label="category",max_length = 200)
	note = forms.CharField(label="note",widget=forms.Textarea(attrs={"rows":5,"cols":20}))
	image = forms.FileField()

class ProfileForm(forms.Form):
	u_name = forms.CharField(label='name',max_length=100)
	phone = forms.CharField(label = 'phone' ,required = True,max_length=10)
	email = forms.EmailField()
	city = forms.CharField(label='city' , max_length=100)

