# Generated by Django 4.2.7 on 2023-12-23 19:51

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('userapp', '0005_alter_simple_user_date_of_birth'),
    ]

    operations = [
        migrations.AlterField(
            model_name='simple_user',
            name='date_of_birth',
            field=models.DateField(default=datetime.datetime(2023, 12, 23, 19, 51, 29, 5328, tzinfo=datetime.timezone.utc)),
        ),
    ]
