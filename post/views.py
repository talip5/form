from django.shortcuts import render, HttpResponse, redirect, get_object_or_404
from .forms import PostForm
from .models import Fihrist
from django.db.models import Q
from django.core.paginator import EmptyPage, PageNotAnInteger, Paginator

def create(request):
    form = PostForm()
    context={
        'form': form,
    }
        #if request.method == "POST":
        #print(request.POST)

    #if request.method == "POST":
       #form=PostForm(request.POST)
        #if form.is_valid():
            #form.save()
        #formdan gelen bilgileri kaydet
    #else:
        #formu kullanıcıya göster

        #form = PostForm()
        #context = {
            #'form': form,
       # }
    form=PostForm(request.POST or None, request.FILES or None)
    if form.is_valid():
        form.save()

    context = {
        'form': form,
    }
    return render(request,'post/form.html',context)

def index(request):

    fihristx = Fihrist.objects.all()

    # contact_list = Contacts.objects.all()
    paginator = Paginator(fihristx, 5)  # Show 25 contacts per page

    page = request.GET.get('sayfa')
    fihristx = paginator.get_page(page)

    query=request.GET.get('q')
    if query:
        fihristx=fihristx.filter(
            Q(title__icontains=query) |
            Q(content__icontains=query)
        ).distinct()

    return render(request,'post/index.html',{'fihristx': fihristx})

def detail(request):

    return HttpResponse('Detail')




def delete(request):

    fihrists = get_object_or_404(Fihrist,id=28)

    fihrists.delete()

    fihrists = get_object_or_404(Fihrist, id=30)

    form = PostForm(request.POST or None, instance=fihrists)

    context = {
        'form': form,
    }

    return render(request, 'post/form.html', context)


def update(request):
    fihrists = get_object_or_404(Fihrist, id=33)

    form = PostForm(request.POST or None, instance=fihrists)

    if form.is_valid():
        form.save()

    context = {
        'form': form,
    }

    return render(request, 'post/form.html', context)

def home(request):

    return HttpResponse('home sayfası')



