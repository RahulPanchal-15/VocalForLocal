from django.db.models.enums import Choices
from django.forms import ModelForm
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django import forms

class CreateUserForm(UserCreationForm):
	class Meta:
		model = User
		fields = ['username', 'email', 'password1', 'password2']

class CreatePost(forms.Form):
	name = forms.CharField(label="Name",max_length = 200)
	category = forms.CharField(label="Category")
	description = forms.CharField(label="Description",widget=forms.Textarea(attrs={"rows":5,"cols":20}))
	image = forms.FileField()
	availability = forms.CharField(label="Shipping..." )


class ProfileForm(forms.Form):
	u_name = forms.CharField(label='Name',max_length=100,widget=forms.TextInput(attrs={'placeholder':'Username'}))
	phone = forms.CharField(label = 'Phone' ,required = True,max_length=10,widget=forms.TextInput(attrs={'placeholder':'Phone no.'}))
	email = forms.EmailField(widget=forms.EmailInput(attrs={'placeholder':'Email'}))
	business_name = forms.CharField(label='Business Name',max_length=100,widget=forms.TextInput(attrs={'placeholder':'Business name'}))
	state = forms.CharField(label="State", max_length=20,widget=forms.TextInput(attrs={'placeholder':'State'}))
	city = forms.CharField(label='City' , max_length=20,widget=forms.TextInput(attrs={'placeholder':'City'}))
	postal_code = forms.CharField(label="Postal Code", max_length=6,widget=forms.TextInput(attrs={'placeholder':'Pincode'}))
	address = forms.CharField(label="Address", max_length=100,widget=forms.TextInput(attrs={'placeholder':'Address'}))
	


