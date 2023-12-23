import pika
from decouple import config
import json


params=pika.URLParameters(config("RABBITMQ_KEY"))
connection=pika.BlockingConnection(params)

channel=connection.channel()

def publish(method,body):
    properties=pika.BasicProperties(method)
    channel.basic_publish(exchange='',routing_key='restoshop', body=json.dumps(body), properties=properties) 