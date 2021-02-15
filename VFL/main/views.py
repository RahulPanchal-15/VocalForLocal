from django.shortcuts import render

# Create your views here.

def main(request):
    return render(request,'main/home.html',context={})

def profile(request):
    return render(request,'main/profile.html',context={})