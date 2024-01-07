import pika
from decouple import config
import json



def publish(method,body):
    #params=pika.URLParameters(config("RABBITMQ_KEY"))
    params=pika.ConnectionParameters(host=config('RABBITMQ_HOST'))
    connection=pika.BlockingConnection(params)

    channel=connection.channel()
    properties=pika.BasicProperties(method)
    channel.basic_publish(exchange='',routing_key='restoshop', body=json.dumps(body), properties=properties) 