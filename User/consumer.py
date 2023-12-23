import pika
from decouple import config
import json
from os import environ
from ..RestoUser.merchantuserapp.models import *


params=pika.URLParameters(config("RABBITMQ_KEY"))
connection=pika.BlockingConnection(params)

channel=connection.channel()

channel.queue_declare(queue='usershop')

def callback(ch, methode, properties, body):
    #Country
    if properties.content_type=="Country_created":
        country=Country(id=body["id"],name=body["name"]) 
        country.save()
        print(f"save successfully {body['name']}")
    elif properties.content_type=="Country_updated":
        pass
    elif properties.content_type=="Country_partial_updated":
        pass
    elif properties.content_type=="Country_deleted":
        pass

channel.basic_consume(queue='usershop',on_message_callback=callback, auto_ack=True)
print("Started consuming")
channel.start_consuming()
channel.close()