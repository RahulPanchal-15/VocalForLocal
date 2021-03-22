import django_filters
from .models import *

class category_filter(django_filters.FilterSet):
    class Meta:
        model = Post
        fields=['category']

class avlblty_filter(django_filters.FilterSet):
    class Meta:
        model = Post
        fields=['availability']