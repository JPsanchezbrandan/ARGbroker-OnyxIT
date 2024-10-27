"""
Primera consulta: nos brinda la informacion de los usuarios disponibles, en conjunto con el 
saldo asignado de sus cuentas de broker.

"""

SELECT 
    usuario.nombre AS nombre_usuario,
    cuenta_broker.saldo_inicial
FROM 
    usuario
JOIN 
    cuenta_broker ON usuario.id = cuenta_broker.id_usuario;




"""
Segunda consulta:  muestra todos los nombres de las acciones disponibles junto 
con su precio de compra y venta actuales.

"""
SELECT 
    accion.nombre_empresa,
    accion.precio_compra_actual,
    accion.precio_venta_actual
FROM 
    accion;



"""
Tercer consulta: muestra la lista de usuarios en conjunto con la cantidad total de ordenes de compra
realizas por cada uno, agrupandolo en columnas.

"""
SELECT 
    usuario.nombre AS nombre_usuario,
    COUNT(orden.id) AS cantidad_ordenes_compra
FROM 
    usuario
JOIN 
    orden ON usuario.id = orden.id_usuario
WHERE 
    orden.tipo_orden = 'COMPRA'
GROUP BY 
    usuario.id;

