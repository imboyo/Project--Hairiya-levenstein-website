from django.db import models
from django.contrib.auth.models import User


# Create your models here.
class UserProfile(models.Model):
    user = models.OneToOneField('auth.User', on_delete=models.CASCADE, related_name='profile')
    nomor_induk = models.CharField(unique=True, max_length=15)
    role = models.CharField(choices=[('admin', 'Admin'), ('mahasiswa', 'Mahasiswa'), ('dosen', 'Dosen')], max_length=10)
