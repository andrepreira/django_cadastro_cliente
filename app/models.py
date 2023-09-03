from django.db import models

class Skill(models.Model):
    name = models.CharField(max_length=50)
    proficiency = models.IntegerField() # 0 to 100

class Project(models.Model):
    title = models.CharField(max_length=100)
    description = models.TextField()
    link = models.CharField(max_length=100)
    image = models.ImageField(upload_to='static/images/', null=True, blank=True)