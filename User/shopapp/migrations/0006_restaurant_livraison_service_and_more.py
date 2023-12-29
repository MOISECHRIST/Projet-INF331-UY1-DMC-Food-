# Generated by Django 4.2.7 on 2023-12-29 22:43

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('shopapp', '0005_alter_commande_date_commande'),
    ]

    operations = [
        migrations.AddField(
            model_name='restaurant',
            name='livraison_service',
            field=models.BooleanField(default=False),
        ),
        migrations.AlterField(
            model_name='commande',
            name='date_commande',
            field=models.DateTimeField(default=datetime.datetime(2023, 12, 29, 22, 43, 22, 776761, tzinfo=datetime.timezone.utc)),
        ),
    ]