from django.db import models


# Create your models here.


class UserInfo(models.Model):
    nid = models.AutoField(primary_key=True)
    username = models.CharField(max_length=32, unique=True)
    password = models.CharField(max_length=32)
    email = models.CharField(max_length=32, unique=True)
    ctime = models.DateTimeField()


class NodeRecord(models.Model):
    nid = models.AutoField(primary_key=True)
    nodename = models.CharField(max_length=32)
    level = models.FloatField()
    rectime = models.DateTimeField()





