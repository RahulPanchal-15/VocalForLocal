from django.contrib import admin

# Register your models here.
from .models import Customer,Post

admin.site.register(Customer)
admin.site.register(Post)

