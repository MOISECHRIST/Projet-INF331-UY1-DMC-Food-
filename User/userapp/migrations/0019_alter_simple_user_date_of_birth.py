# Generated by Django 4.2.7 on 2024-01-07 19:21

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('userapp', '0018_alter_simple_user_date_of_birth'),
    ]

    operations = [
        migrations.AlterField(
            model_name='simple_user',
            name='date_of_birth',
            field=models.DateField(default=datetime.datetime(2024, 1, 7, 19, 21, 18, 688845, tzinfo=datetime.timezone.utc)),
        ),
    ]