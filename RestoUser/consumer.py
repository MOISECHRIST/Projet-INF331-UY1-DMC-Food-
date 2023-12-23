import pika
from decouple import config
import django
from sys import path
from os import environ
import json


#params=pika.URLParameters(config("RABBITMQ_KEY"))
#connection=pika.BlockingConnection(params)
path.append('../RestoUser/settings.py') #Your path to settings.py file
environ.setdefault('DJANGO_SETTINGS_MODULE', 'User.settings') 
django.setup()

connection = pika.BlockingConnection(pika.ConnectionParameters('localhost', heartbeat=600, blocked_connection_timeout=300))
channel=connection.channel()

channel.queue_declare(queue='restoshop')

def callback(ch, methode, properties, body):
    print("Received in restoshop...")
    print(body)
    data=json.loads(body)
    print(data)

    #Simple_User
    if properties.content_type=="Simple_User_created":
        pass
    elif properties.content_type=="Simple_User_updated":
        pass
    elif properties.content_type=="Simple_User_partial_updated":
        pass
    elif properties.content_type=="Simple_User_deleted":
        pass

    #Commande
    elif properties.content_type=="Commande_created":
        pass
    elif properties.content_type=="Commande_updated":
        pass
    elif properties.content_type=="Commande_partial_updated":
        pass
    elif properties.content_type=="Commande_deleted":
        pass
    pass

channel.basic_consume(queue='restoshop',on_message_callback=callback)
print("Started consuming")
channel.start_consuming()
channel.close()