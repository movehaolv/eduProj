from django.db import models

# Create your models here.

class T1(models.Model):
    name = models.CharField(max_length=10,null=True,blank=True)
    nickname = models.CharField(max_length=10,null=True)
    height = models.CharField(max_length=10,unique=True,null=True,blank=True)
    weight = models.CharField(max_length=10,unique=True,blank=True)
    t1 = models.CharField(max_length=10)
    t2 = models.CharField(max_length=10,null=False)

