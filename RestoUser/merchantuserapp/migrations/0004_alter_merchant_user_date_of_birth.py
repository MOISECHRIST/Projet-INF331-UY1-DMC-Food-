# Generated by Django 4.2.7 on 2023-11-10 23:29

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("merchantuserapp", "0003_alter_merchant_user_date_of_birth"),
    ]

    operations = [
        migrations.AlterField(
            model_name="merchant_user",
            name="date_of_birth",
            field=models.DateField(
                default=datetime.datetime(
                    2023, 11, 10, 23, 29, 7, 318434, tzinfo=datetime.timezone.utc
                )
            ),
        ),
    ]
