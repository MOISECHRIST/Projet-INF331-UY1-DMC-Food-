import pika
from decouple import config


params=pika.URLParameters(config("RABBITMQ_KEY"))


connection=pika.BlockingConnection(params)

channel=connection.channel()

def publish(method,body):
    pass