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



--CORRECCION

-- Agregar ejemplos, y realizar consultas mas complejas


""" Mostrar las acciones que mas se han comprado o vendido en un dia determinado, especificando la cantidad,
el precio de venta o compra

"""

SELECT 
    accion.nombre_empresa,
    SUM(cotizacion_historica.cantidad) AS cantidad_total,
    CASE 
        WHEN orden.tipo_de_orden = 'COMPRA' THEN accion.precio_compra_actual
        WHEN orden.tipo_de_orden = 'VENTA' THEN accion.precio_venta_actual
    END AS precio_accion
FROM 
    cotizacion_historica
JOIN 
    orden ON cotizacion_historica.id_accion = orden.id_accion
JOIN 
    accion ON orden.id_accion = accion.id_accion
WHERE 
    cotizacion_historica.fecha = '2024-10-20'  
GROUP BY 
    accion.id_accion, orden.tipo_de_orden;




""" Mostrar el saldo actual de las cuentas de los usuarios,sumando todas las transacciones (compra/venta)
y considerando comisiones.

"""

SELECT 
    usuario.nombre AS nombre_usuario,
    (cuenta_broker.saldo_inicial - 
    SUM(CASE WHEN transacciones.tipo = 'COMPRA' THEN transacciones.monto_invertido + transacciones.comision 
        WHEN transacciones.tipo = 'VENTA' THEN (transacciones.monto_invertido - transacciones.comision) END)
    ) AS saldo_actual
FROM 
    usuario
JOIN 
    cuenta_broker ON usuario.id = cuenta_broker.id_usuario
LEFT JOIN 
    transacciones ON usuario.id = transacciones.id_usuario
GROUP BY 
    usuario.id, cuenta_broker.saldo_inicial;




"""  Muestra la cantidad de órdenes no ejecutadas de cada usuario 

"""

SELECT 
    usuario.nombre AS nombre_usuario,
    COUNT(CASE WHEN orden.tipo_de_orden = 'COMPRA' THEN 1 END) AS cantidad_ordenes_compra_no_ejecutadas,
    COUNT(CASE WHEN orden.tipo_de_orden = 'VENTA' THEN 1 END) AS cantidad_ordenes_venta_no_ejecutadas
FROM 
    usuario
JOIN 
    orden ON usuario.id = orden.id_usuario
WHERE 
    orden.estado = 'PENDIENTE'  
GROUP BY 
    usuario.id;