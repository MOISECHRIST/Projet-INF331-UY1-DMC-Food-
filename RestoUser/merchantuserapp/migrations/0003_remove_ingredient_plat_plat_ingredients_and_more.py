# Generated by Django 4.2.7 on 2023-12-30 23:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('merchantuserapp', '0002_restaurant_livraison_service'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='ingredient',
            name='plat',
        ),
        migrations.AddField(
            model_name='plat',
            name='ingredients',
            field=models.ManyToManyField(null=True, to='merchantuserapp.ingredient'),
        ),
        migrations.AddField(
            model_name='platmenu',
            name='nb_etoile',
            field=models.IntegerField(default=0),
        ),
    ]
