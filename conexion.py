import mysql.connector

conexion = mysql.connector.connect(
    user='root', 
    password='diciembre',
    host='localhost',
    database='sys',
    port='3307')
print(conexion)
