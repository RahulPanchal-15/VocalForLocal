from django.db import models

# Create your models here.

class User(models.Model):
    id = models.IntegerField(primary_key=True, null=False)
    name = models.CharField(max_length=200, null=True)
    phone = models.CharField(max_length=200, null=True)
    email = models.CharField(max_length=200, null=True)
    city = models.CharField(max_length=200, null=False)
    date_created = models.DateTimeField(auto_now_add=True, null=True)

    def __str__(self):
	    return self.name

# class Product(models.Model):
# 	CATEGORY = (
# 			('Indoor', 'Indoor'),
# 			('Out Door', 'Out Door'),
# 			) 

# 	name = models.CharField(max_length=200, null=True)
# 	price = models.FloatField(null=True)
# 	category = models.CharField(max_length=200, null=True, choices=CATEGORY)
# 	description = models.CharField(max_length=200, null=True, blank=True)
# 	date_created = models.DateTimeField(auto_now_add=True, null=True)
# 	tags = models.ManyToManyField(Tag)

# 	def __str__(self):
# 		return self.name

class Post(models.Model):
    note = models.CharField(max_length=1000, null=True)
    photo = models.ImageField()
    user = models.ForeignKey(User, null=True, on_delete= models.SET_NULL)
    date_created = models.DateTimeField(auto_now_add=True, null=True)
    category = models.CharField(max_length=200, null=True)
   

    def __str__(self):
	    return self.name
