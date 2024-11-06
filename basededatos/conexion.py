import mysql.connector

def obtener_conexion():
    conexion = mysql.connector.connect(
    user='root', 
    password='diciembre',
    host='localhost',
    database='proyectointegrador',
    port='3307'
    )


    print("Conexion exitosa a la base de datos")
    return conexion


conexion = obtener_conexion()






