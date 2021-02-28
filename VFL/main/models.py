from django.db import models

# Create your models here.

class Customer(models.Model):
    id = models.IntegerField(primary_key=True, null=False)
    name = models.CharField(max_length=200, null=True)
    phone = models.CharField(max_length=200, null=True)
    email = models.CharField(max_length=200, null=True)
    city = models.CharField(max_length=200, null=False)
    date_created = models.DateTimeField(auto_now_add=True, null=True)

    def __str__(self):
	    return self.name


class Post(models.Model):
    name = models.CharField(max_length=200,null=True)
    note = models.CharField(max_length=1000, null=True)
    photo = models.FileField(upload_to="images/",null=True,verbose_name="")
    user = models.ForeignKey(Customer, null=True, on_delete= models.SET_NULL)
    date_created = models.DateTimeField(auto_now_add=True, null=True)
    category = models.CharField(max_length=200, null=True)
   
    def __str__(self):
	    return self.name