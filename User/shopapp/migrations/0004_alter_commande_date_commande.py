# Generated by Django 4.2.7 on 2023-12-23 19:51

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('shopapp', '0003_alter_commande_date_commande'),
    ]

    operations = [
        migrations.AlterField(
            model_name='commande',
            name='date_commande',
            field=models.DateTimeField(default=datetime.datetime(2023, 12, 23, 19, 51, 29, 11593, tzinfo=datetime.timezone.utc)),
        ),
    ]