# Generated by Django 3.2.14 on 2022-07-28 00:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userprofile',
            name='nomor_induk',
            field=models.CharField(max_length=15),
        ),
    ]
