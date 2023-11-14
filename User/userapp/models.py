from django.db import models
from django.contrib.auth.models import AbstractUser
from django.utils.timezone import now


class Health_Problem(models.Model):

    PROBLEMS = [
        ("hypertension", "hypertension"),
        ("hypercholestérolémie", "hypercholestérolémie"),
        ("athérosclérose", "athérosclérose"),
        ("diabète", "diabète"),
        ("obésité", "obésité"),
        ("insuffisance rénale", "insuffisance rénale"),
        ("maladie de Crohn", "maladie de Crohn"),
    ]

    name = models.CharField(max_length=255, blank=False, unique=True, choices=PROBLEMS)
    description = models.TextField(null=True, blank=True)

    def __str__(self):
        return self.name


class Simple_User(AbstractUser):

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
    health_problem=models.ManyToManyField(Health_Problem, blank=True)

    def __str__(self):
        age = now().year - self.date_of_birth.year
        return f"{self.username} ({age} ans)"
