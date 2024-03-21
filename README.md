# Projet-INF331-UY1-DMC-Food-
Ce projet est une application web microservice pour la recherche et la commande de plat.
Cette application est developpe avec django rest framework pour le backend et bootstrapp pour le front end. 

# Dependence du projet
- Docker </br>
- Python v3.11 </br>

# Execution du projet 
Pour executer le projet vous devez taper la commande ci dessous dans le dossier racine du projet :</br>
sudo docker compose build
sudo docker compose up


# Structure du projet
Ci dessous l'achitecture de c'est dossiers: 
<h2>RestoUser</h2>
RestoUser/</br>
├── data_resto.csv</br>
├── manage.py</br>
├── media</br>
│   └── resto_img</br>
│       ├── ...</br>
├── merchantuserapp</br>
│   ├── admin.py</br>
│   ├── apps.py</br>
│   ├── __init__.py</br>
│   ├── migrations</br>
│   │   ├── __init__.py</br>
│   │   └── __pycache__</br>
│   │       ├── ...</br>
│   ├── models.py</br>
│   ├── __pycache__</br>
│   │   ├── ...</br>
│   ├── serializers.py</br>
│   ├── tests.py</br>
│   ├── urls.py</br>
│   └── views.py</br>
├── requirement.txt</br>
└── RestoUser</br>
    ├── asgi.py</br>
    ├── __init__.py</br>
    ├── __pycache__</br>
    │   ├── ...</br>
    ├── settings.py</br>
    ├── urls.py</br>
    └── wsgi.py</br>

<h2>User</h2>
User/</br>
├── data_health.csv</br>
├── db.sqlite3</br>
├── freezer.sh</br>
├── manage.py</br>
├── media</br>
│   └── user_img</br>
│       └── ...</br>
├── requirement.txt</br>
├── User</br>
│   ├── asgi.py</br>
│   ├── __init__.py</br>
│   ├── __pycache__</br>
│   │   ├── ...</br>
│   ├── settings.py</br>
│   ├── urls.py</br>
│   └── wsgi.py</br>
└── userapp</br>
    ├── admin.py</br>
    ├── apps.py</br>
    ├── __init__.py</br>
    ├── migrations</br>
    │   ├── ...</br>
    │   └── __pycache__</br>
    │       ├── ...</br>
    ├── models.py</br>
    ├── __pycache__</br>
    │   ├── ...</br>
    ├── serializers.py</br>
    ├── tests.py</br>
    ├── urls.py</br>
    └── views.py</br>
