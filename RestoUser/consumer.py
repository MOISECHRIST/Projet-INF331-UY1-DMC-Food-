import pika
from decouple import config
import json
import pymysql.cursors

dbconn = pymysql.connect(host=config('DB_HOST'),
                                user=config('DB_USER'),
                                password=config('DB_PASSWORD'),
                                database=config('DB_NAME'))

#params=pika.URLParameters(config("RABBITMQ_KEY"))
params=pika.ConnectionParameters(host="localhost")
connection=pika.BlockingConnection(params)

channel=connection.channel()

channel.queue_declare(queue='usershop')

def query_to_table(dbconn, methode ,data,fields):
    model_name=methode.split('_')[0]
    action=methode.split('_')[1]
    if model_name.upper()=="SIMPLEUSER":
        table="shopapp_simpleuser"
    elif model_name.upper()=="APRECIATIONUSER":
        table="shopapp_apreciationuser"
    else:
        table="shopapp_commande"
    
    if action.upper()=="CREATED":
        values=''
        for i in range(len(data.keys())): 
            if i==0:
                values='%s'
            else:
                values+=',%s'
        
        sql=f"INSERT INTO `{table}` values({values})"
        print(sql)

        list_data=[]
        for key in data.keys():
            list_data+=[data[key]]
        
        print(list(list_data))

        with dbconn.cursor() as cursor:
            cursor.execute(sql, list(list_data))
            dbconn.commit()

    elif action.upper()=="UPDATED" or action.upper()=="PARTIALUPDATED":
        values=''
        i=0
        for key in data.keys(): 
            if i==0:
                values=f"{fields[i]}={data[key]}"
            else:
                values+=f",{fields[i]}={data[key]}"

            i+=1
        
        pk="id"
        sql=f"UPDATE `{table}` set {values} where id={data[pk]}"
        print(sql)

        with dbconn.cursor() as cursor:
            cursor.execute(sql)
            dbconn.commit()
    
    else:       
        pk="id"
        sql=f"DELETE FROM `{table}` where id={data[pk]}"
        print(sql)

        with dbconn.cursor() as cursor:
            cursor.execute(sql)
            dbconn.commit()


def callback(ch, methode, properties, body):
    print("Received in restoshop...")
    data=json.loads(body)
    print(data)
    methode = properties.content_type
    model_name=methode.split('_')[0]
    action=methode.split('_')[1]
    if model_name.upper()=="SIMPLEUSER":
        list_keys=["id","email","phone_number"]
        new_data={}
        for key in list_keys:
            if key=="email":
                new_data[key]=""
            else:
                new_data[key]=data[key]
        query_to_table(dbconn,methode,new_data, list_keys)
    elif model_name.upper()=="APRECIATIONUSER":
        fields=["id","numero","jour_semaine","restaurant_id"]
        query_to_table(dbconn,methode,data,fields)
    else:
        fields=["id","numero","status","date_commande","plat_id","restaurant_id"]
        query_to_table(dbconn,methode,data, fields)

channel.basic_consume(queue='usershop',on_message_callback=callback)
print("Started consuming")
channel.start_consuming()
channel.close()
dbconn.close()
