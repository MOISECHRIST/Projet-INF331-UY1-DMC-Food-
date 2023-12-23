# Generated by Django 4.2.7 on 2023-11-24 21:03

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('userapp', '0003_alter_simple_user_date_of_birth'),
    ]

    operations = [
        migrations.CreateModel(
            name='City',
            fields=[
                ('id', models.PositiveIntegerField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Country',
            fields=[
                ('id', models.PositiveIntegerField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=50, unique=True)),
            ],
        ),
        migrations.CreateModel(
            name='Menu',
            fields=[
                ('id', models.PositiveIntegerField(primary_key=True, serialize=False)),
                ('numero', models.CharField(max_length=20, unique=True)),
                ('jour_semaine', models.CharField(choices=[('lundi', 'lundi'), ('mardi', 'mardi'), ('mercredi', 'mercredi'), ('jeudi', 'jeudi'), ('vendredi', 'vendredi'), ('samedi', 'samedi'), ('dimanche', 'dimanche')], max_length=10)),
            ],
        ),
        migrations.CreateModel(
            name='Plat',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nom_plat', models.CharField(max_length=255, unique=True)),
                ('description', models.TextField(blank=True, null=True)),
                ('image_plat', models.ImageField(blank=True, null=True, upload_to='plat_img')),
                ('recette', models.TextField(blank=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Quartier',
            fields=[
                ('id', models.PositiveIntegerField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=50)),
                ('city', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shopapp.city')),
            ],
        ),
        migrations.CreateModel(
            name='Restaurant',
            fields=[
                ('id', models.PositiveIntegerField(primary_key=True, serialize=False)),
                ('restorent_name', models.CharField(blank=True, max_length=255, null=True)),
                ('phone_number', models.CharField(blank=True, max_length=255)),
                ('longitude', models.FloatField(default=0.0)),
                ('latitude', models.FloatField(default=0.0)),
                ('image', models.ImageField(blank=True, null=True, upload_to='resto_img')),
                ('quartier', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='shopapp.quartier')),
            ],
        ),
        migrations.CreateModel(
            name='PlatMenu',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('prix', models.IntegerField(default=1000)),
                ('quantite', models.IntegerField(default=1)),
                ('unite_quantite', models.CharField(default='plat', max_length=255)),
                ('menu', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shopapp.menu')),
                ('plat', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shopapp.plat')),
            ],
        ),
        migrations.AddField(
            model_name='menu',
            name='restaurant',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shopapp.restaurant'),
        ),
        migrations.CreateModel(
            name='Ingredient',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nom_ingredient', models.CharField(max_length=255, unique=True)),
                ('description', models.TextField(blank=True, null=True)),
                ('plat', models.ManyToManyField(to='shopapp.plat')),
            ],
        ),
        migrations.CreateModel(
            name='Commande',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('numero', models.CharField(max_length=20)),
                ('status', models.CharField(choices=[('En cours', 'En cours'), ('Validée', 'Validée'), ('Annulée', 'Annulée')], max_length=10)),
                ('date_commande', models.DateTimeField(default=datetime.datetime(2023, 11, 24, 21, 3, 19, 209725, tzinfo=datetime.timezone.utc))),
                ('plat', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shopapp.plat')),
                ('restaurant', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shopapp.restaurant')),
                ('utilisateur', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='userapp.simple_user')),
            ],
        ),
        migrations.AddField(
            model_name='city',
            name='country',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shopapp.country'),
        ),
    ]