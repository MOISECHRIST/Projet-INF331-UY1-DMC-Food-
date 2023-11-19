# Projet-INF331-UY1-DMC-Food-
Ce repertoire contiendra le code source en phase de developpement du projet INF331 nommé DMC Food-2023
En date du 19/11/2023 nous avons developpé deux projet api (RestoUser et User) qui vont gérer respectivement les comptes marchants des restaurants et les comptes des simples utilisateurs.

Ci dessous l'achitecture de c'est dossiers: 
<h2>RestoUser</h2>
RestoUser/
├── data_resto.csv
├── manage.py
├── media
│   └── resto_img
│       ├── ...
├── merchantuserapp
│   ├── admin.py
│   ├── apps.py
│   ├── __init__.py
│   ├── migrations
│   │   ├── __init__.py
│   │   └── __pycache__
│   │       ├── ...
│   ├── models.py
│   ├── __pycache__
│   │   ├── ...
│   ├── serializers.py
│   ├── tests.py
│   ├── urls.py
│   └── views.py
├── requirement.txt
└── RestoUser
    ├── asgi.py
    ├── __init__.py
    ├── __pycache__
    │   ├── ...
    ├── settings.py
    ├── urls.py
    └── wsgi.py

<h2>User</h2>
User/
├── data_health.csv
├── db.sqlite3
├── freezer.sh
├── manage.py
├── media
│   └── user_img
│       └── ...
├── requirement.txt
├── User
│   ├── asgi.py
│   ├── __init__.py
│   ├── __pycache__
│   │   ├── ...
│   ├── settings.py
│   ├── urls.py
│   └── wsgi.py
└── userapp
    ├── admin.py
    ├── apps.py
    ├── __init__.py
    ├── migrations
    │   ├── ...
    │   └── __pycache__
    │       ├── ...
    ├── models.py
    ├── __pycache__
    │   ├── ...
    ├── serializers.py
    ├── tests.py
    ├── urls.py
    └── views.py
