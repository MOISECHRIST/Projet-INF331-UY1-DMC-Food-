import pika
from decouple import config
import json
from os import environ
import pymysql.cursors

dbconn = pymysql.connect(host=config('DB_HOST'),
                                user=config('DB_USER'),
                                password=config('DB_PASSWORD'),
                                database=config('DB_NAME'))


#params=pika.URLParameters(config("RABBITMQ_KEY"))
params=pika.ConnectionParameters(host=config("DB_HOST"))
connection=pika.BlockingConnection(params)

channel=connection.channel()

channel.queue_declare(queue='shop')

def callback(ch, methode, properties, body):
    print("Received in usershop...")
    data=json.loads(body)
    print(data)

    #Country
    if properties.content_type=="Country_created":
        print(f"save successfully {data['name']}")

    elif properties.content_type=="Country_updated":
        pass
    elif properties.content_type=="Country_partial_updated":
        pass
    elif properties.content_type=="Country_deleted":
        pass

channel.basic_consume(queue='restoshop',on_message_callback=callback, auto_ack=True)
print("Started consuming")
channel.start_consuming()
channel.close()
dbconn.close()