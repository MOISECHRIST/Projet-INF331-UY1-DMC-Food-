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
params=pika.ConnectionParameters(host="localhost")
connection=pika.BlockingConnection(params)

channel=connection.channel()

channel.queue_declare(queue='restoshop')

def query_to_tables(dbconn, methode ,data):
    model_name=methode.split('_')[0]
    action=methode.split('_')[1]
    if model_name.upper()=="COUNTRY":
        table="shopapp_country"
    elif model_name.upper()=="CITY":
        table="shopapp_city"
    elif model_name.upper()=="RESTAURANT":
        table="shopapp_restaurant"
    elif model_name.upper()=="QUARTIER":
        table="shopapp_quartier"
    elif model_name.upper()=="MENU":
        table="shopapp_menu"
    elif model_name.upper()=="PLAT":
        table="shopapp_plat"
    elif model_name.upper()=="PLATMENU":
        table="shopapp_platmenu"
    elif model_name.upper()=="INGREDIENT":
        table="shopapp_ingredient"
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
                values=f"{key}={data[key]}"
            else:
                values+=f",{key}={data[key]}"

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
    print("Received in usershop...")
    data=json.loads(body)
    print(data)
    methode = properties.content_type
    
    model_name=methode.split('_')[0]
    action=methode.split('_')[1]
    if model_name.upper()=="RESTAURANT":
        list_keys=["id","restorent_name","phone_number","longitude","latitude","image","quartier","livraison_service"]
        new_data={}
        for key in list_keys:
            new_data[key]=data[key]
        query_to_tables(dbconn,methode,new_data)
    elif model_name.upper()=="INGREDIENT":
        table="shopapp_ingredient_plat"
        if action.upper()=="DELETED":
            with dbconn.cursor() as cursor:
                pk="id"
                sql=f"DELETE FROM `{table}` where ingredient_id={data[pk]}"
                print(sql)
                cursor.execute(sql)
                dbconn.commit()
                query_to_tables(dbconn,methode,data)
        else:
            query_to_tables(dbconn,methode,data)
    elif model_name.upper()=="PLAT":
        table="shopapp_plat_ingredients"
        list_keys=["id","nom_plat","description","image_plat","recette"]
        new_data={}
        for key in list_keys:
            new_data[key]=data[key]
        if action.upper()=="DELETED":
            with dbconn.cursor() as cursor:
                pk="id"
                sql=f"DELETE FROM `{table}` where plat_id={new_data[pk]}"
                print(sql)
                cursor.execute(sql)
                dbconn.commit()
            query_to_tables(dbconn,methode,new_data)
        else:
            query_to_tables(dbconn,methode,new_data)
            ingredients=data["ingredients"]
            if action.upper()=="CREATED":
                with dbconn.cursor() as cursor:
                    for i in range(len(ingredients)): 
                        sql=f"INSERT INTO `{table}` values(%s,%s, %s)"
                        print(sql)
                        all_data=f"select * from {table}"
                        cursor.execute(all_data)
                        all_data=cursor.fetchall()
                        print(all_data)
                        nb=len(all_data)
                        cursor.execute(sql, (nb+1, data["id"], ingredients[i]))
                        dbconn.commit()

            elif action.upper()=="UPDATED" or action.upper()=="PARTIALUPDATED":
                with dbconn.cursor() as cursor:
                    for i in range(len(ingredients)):  
                        pk="id"
                        sql=f"UPDATE `{table}` set ingredient_id={ingredients[i]},  where plat_id={data[pk]}"
                        print(sql)
                        cursor.execute(sql, (data["id"], ingredients[i]))
                        dbconn.commit()

    else:
        query_to_tables(dbconn,methode,data)

channel.basic_consume(queue='restoshop',on_message_callback=callback, auto_ack=True)
print("Started consuming")
channel.start_consuming()
channel.close()
dbconn.close()
