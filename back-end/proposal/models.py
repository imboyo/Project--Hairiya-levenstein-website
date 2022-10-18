from django.db import models


# Create your models here.
class Proposal(models.Model):
    mahasiswa = models.ManyToManyField('auth.User', related_name='mahasiswa')
    dosen = models.ManyToManyField('auth.User', related_name='dosen')
    title = models.CharField(max_length=300)
    file = models.FileField(upload_to='proposal/', max_length=300)
    created_at = models.DateTimeField(auto_now_add=True)
    plagiarism_percentage = models.FloatField(default=0)

    def __str__(self):
        return self.title
