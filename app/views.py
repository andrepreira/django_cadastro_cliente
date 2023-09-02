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