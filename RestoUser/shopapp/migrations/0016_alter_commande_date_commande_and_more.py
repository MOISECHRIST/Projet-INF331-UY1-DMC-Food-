# Generated by Django 4.2.7 on 2024-01-19 20:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('shopapp', '0015_commande_date_delai_alter_commande_date_commande'),
    ]

    operations = [
        migrations.AlterField(
            model_name='commande',
            name='date_commande',
            field=models.DateTimeField(),
        ),
        migrations.AlterField(
            model_name='commande',
            name='date_delai',
            field=models.DateTimeField(),
        ),
    ]
