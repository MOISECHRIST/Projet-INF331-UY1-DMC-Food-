import pika
from decouple import config


params=pika.URLParameters(config("RABBITMQ_KEY"))


connection=pika.BlockingConnection(params)

channel=connection.channel()

channel.queue_declare(queue='user')

def callback(ch, methode, properties, body):
    pass

channel.basic_consume(queue='user',on_message_callback=callback)

print("Started consuming")

channel.start_consuming()

channel.close()