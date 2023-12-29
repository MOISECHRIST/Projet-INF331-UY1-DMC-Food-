import pika
from decouple import config
import json 



def publish(method,body):
    params=pika.URLParameters(config("RABBITMQ_KEY"))
    connection=pika.BlockingConnection(params)


    channel=connection.channel()
    properties=pika.BasicProperties(method)
    channel.basic_publish(exchange='',routing_key='shop', body=json.dumps(body), properties=properties) 