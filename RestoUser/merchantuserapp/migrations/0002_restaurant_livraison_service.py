# Generated by Django 4.2.7 on 2023-12-29 22:42

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('merchantuserapp', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='restaurant',
            name='livraison_service',
            field=models.BooleanField(default=False),
        ),
    ]
