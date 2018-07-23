from django.db import models

# Create your models here.
class Header(models.Model):
    uuid = models.CharField(max_length=100)
    title = models.CharField(max_length=100)
    formUUID = models.CharField(max_length=100)
    qrcodeURL = models.ImageField(upload_to='images')


