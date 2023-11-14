from django.db import models
from django.contrib.auth.models import AbstractUser
from django.utils.timezone import now


class Country(models.Model):
    name = models.CharField(max_length=50, unique=True)

    def __str__(self):
        return self.name


class City(models.Model):
    name = models.CharField(max_length=50)
    country = models.ForeignKey(Country, on_delete=models.CASCADE)

    def __str__(self):
        return self.name


class Restorent(models.Model):
    name = models.CharField(max_length=255)
    city = models.ForeignKey(City, on_delete=models.CASCADE)
    longitude = models.FloatField(default=0.0, null=True)
    latitude = models.FloatField(default=0.0, null=True)

    def __str__(self):
        return self.name


class Merchant_User(AbstractUser):
    GENDER = [
        ("-", "None"),
        ("f", "Female"),
        ("m", "Male"),
    ]

    date_of_birth = models.DateField(null=False, default=now())
    image = models.ImageField(upload_to="user_img", blank=True, null=True)
    size = models.FloatField(default=0.0)
    weigth = models.FloatField(default=0.0)
    phone_number = models.CharField(max_length=255, blank=True)
    gender = models.CharField(max_length=1, choices=GENDER, null=False, blank=False)
    longitude = models.FloatField(default=0.0)
    latitude = models.FloatField(default=0.0)
    restorent = models.ForeignKey(Restorent, null=True, on_delete=models.CASCADE, blank=True)

    def __str__(self):
        age = now().year - self.date_of_birth.year
        return f"{self.username} ({age} ans)"
