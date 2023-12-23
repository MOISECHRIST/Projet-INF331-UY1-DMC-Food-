import pika
from decouple import config
import django
from sys import path
import json
from os import environ


#params=pika.URLParameters(config("RABBITMQ_KEY"))
#connection=pika.BlockingConnection(params)

path.append('../User/settings.py') #Your path to settings.py file
environ.setdefault('DJANGO_SETTINGS_MODULE', 'User.settings') 
django.setup()

connection = pika.BlockingConnection(pika.ConnectionParameters('localhost', heartbeat=600, blocked_connection_timeout=300))
channel=connection.channel()

channel.queue_declare(queue='usershop')

def callback(ch, methode, properties, body):
    pass

channel.basic_consume(queue='usershop',on_message_callback=callback, auto_ack=True)
print("Started consuming")
channel.start_consuming()
channel.close()