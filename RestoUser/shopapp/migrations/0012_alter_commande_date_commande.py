# Generated by Django 4.2.7 on 2024-01-04 22:14

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('shopapp', '0011_alter_commande_date_commande_apreciationuser'),
    ]

    operations = [
        migrations.AlterField(
            model_name='commande',
            name='date_commande',
            field=models.DateTimeField(default=datetime.datetime(2024, 1, 4, 22, 14, 56, 469280, tzinfo=datetime.timezone.utc)),
        ),
    ]
