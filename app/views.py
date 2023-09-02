from django.shortcuts import render
from app.models import Project, Skill

def home(request):
    skills = Skill.objects.all()
    projects = Project.objects.all()
    return render(
        request,
        'home.html',
        {'skills': skills, 'projects': projects}
    )

def detail(request, pk):
    project = Project.objects.get(pk=pk)
    return render(
        request,
        'detail.html',
        {'project': project}
    )