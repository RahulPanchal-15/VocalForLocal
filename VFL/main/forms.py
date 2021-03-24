from django.db.models.enums import Choices
from django.forms import ModelForm
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django import forms

state_choices = (("Andhra Pradesh","Andhra Pradesh"),("Arunachal Pradesh ","Arunachal Pradesh "),("Assam","Assam"),("Bihar","Bihar"),
("Chhattisgarh","Chhattisgarh"),("Goa","Goa"),("Gujarat","Gujarat"),("Haryana","Haryana"),("Himachal Pradesh","Himachal Pradesh"),
("Jammu and Kashmir ","Jammu and Kashmir "),("Jharkhand","Jharkhand"),("Karnataka","Karnataka"),("Kerala","Kerala"),("Madhya Pradesh","Madhya Pradesh"),("Maharashtra","Maharashtra"),("Manipur","Manipur"),("Meghalaya","Meghalaya"),("Mizoram","Mizoram"),("Nagaland","Nagaland"),("Odisha","Odisha"),("Punjab","Punjab"),("Rajasthan","Rajasthan"),("Sikkim","Sikkim"),("Tamil Nadu","Tamil Nadu"),("Telangana","Telangana"),("Tripura","Tripura"),("Uttar Pradesh","Uttar Pradesh"),("Uttarakhand","Uttarakhand"),("West Bengal","West Bengal"),("Andaman and Nicobar Islands","Andaman and Nicobar Islands"),("Chandigarh","Chandigarh"),("Dadra and Nagar Haveli","Dadra and Nagar Haveli"),("Daman and Diu","Daman and Diu"),("Lakshadweep","Lakshadweep"),("National Capital Territory of Delhi","National Capital Territory of Delhi"),("Puducherry","Puducherry"))

shipping=(("Local","Local"),("Span-India","Span-India"),("Global","Global"),)

category = (("Accessories","Accessories"),("Art","Art"),("Clothing","Clothing"),("Electronics","Electronics"),("Food Items","Food Items"),("Handicraft","Handicraft"),("Home Decor","Home Decor"),("Others","Others"))

class CreateUserForm(UserCreationForm):
	class Meta:
		model = User
		fields = ['username', 'email', 'password1', 'password2']

class CreatePost(forms.Form):
	name = forms.CharField(label="Name",max_length = 200)
	category = forms.CharField(label="Category",widget=forms.Select(choices=category))
	description = forms.CharField(label="Description",widget=forms.Textarea(attrs={"rows":2,"cols":40}))
	image = forms.FileField()
	availability = forms.CharField(label="Shipping...",widget=forms.Select(choices=shipping) )


class ProfileForm(forms.Form):
	u_name = forms.CharField(label='Name',max_length=100,widget=forms.TextInput(attrs={'placeholder':''}))
	phone = forms.CharField(label = 'Phone' ,required = True,max_length=10,widget=forms.TextInput(attrs={'placeholder':''}))
	email = forms.EmailField(widget=forms.EmailInput(attrs={'placeholder':''}))
	business_name = forms.CharField(label='Business Name',max_length=100,widget=forms.TextInput(attrs={'placeholder':' '}))
	state = forms.CharField(label="State",widget=forms.Select(choices=state_choices))
	city = forms.CharField(label='City' , max_length=20,widget=forms.TextInput(attrs={'placeholder':''}))
	postal_code = forms.CharField(label="Postal Code", max_length=6,widget=forms.TextInput(attrs={'placeholder':''}))
	address = forms.CharField(label="Address", max_length=100,widget=forms.TextInput(attrs={'placeholder':''}))
	


