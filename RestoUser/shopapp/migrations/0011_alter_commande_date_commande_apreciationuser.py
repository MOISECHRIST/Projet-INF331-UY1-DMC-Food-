# Generated by Django 4.2.7 on 2023-12-31 19:10

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('merchantuserapp', '0003_remove_ingredient_plat_plat_ingredients_and_more'),
        ('shopapp', '0010_alter_commande_date_commande'),
    ]

    operations = [
        migrations.AlterField(
            model_name='commande',
            name='date_commande',
            field=models.DateTimeField(default=datetime.datetime(2023, 12, 31, 19, 10, 43, 489671, tzinfo=datetime.timezone.utc)),
        ),
        migrations.CreateModel(
            name='ApreciationUser',
            fields=[
                ('id', models.PositiveIntegerField(primary_key=True, serialize=False)),
                ('nb_etoile', models.IntegerField(choices=[('0', 0), ('1', 1), ('2', 2), ('3', 3), ('4', 4), ('5', 5)])),
                ('plat', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='merchantuserapp.platmenu')),
                ('utilisateur', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shopapp.simpleuser')),
            ],
        ),
    ]