import pika
from decouple import config
import json
import pymysql.cursors

dbconn = pymysql.connect(host=config('DB_HOST'),
                                user=config('DB_USER'),
                                password=config('DB_PASSWORD'),
                                database=config('DB_NAME'))

#params=pika.URLParameters(config("RABBITMQ_KEY"))
params=pika.ConnectionParameters(host=config("DB_HOST"))
connection=pika.BlockingConnection(params)

channel=connection.channel()

channel.queue_declare(queue='usershop')

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

channel.basic_consume(queue='usershop',on_message_callback=callback)
print("Started consuming")
channel.start_consuming()
channel.close()
dbconn.close()
