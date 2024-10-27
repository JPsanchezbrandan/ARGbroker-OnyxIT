Table usuario {
id usuario [pk]
nombre varchar (100)
email varchar (100)
apellido varchar(100)
cuit text
contraseña text 
saldo decimal (10,2)
}

Table broker {
id cuenta [pk]
saldo_inicial decimal(10,2)
fecha_creacion datetime
FOREIGN KEY (id_usuario) unique

}

Table accion {
id accion [pk]
nombre_de_empresa varchar(100)
ultimo_operado datetime
cantidad_compra_diaria int
precio_compra_actual decimal(10,2)
precio_venta_actual decimal(10,2)
cantidad_venta_diaria int
apertura decimal (10,2)
minimo_diario decimal (10,2)
maximo_diario decimal (10,2)
ultimo_cierre decimal (10,2)
}

Table cotizacion_historica {
id cotizacion [pk]
id_simbolo int
fecha datetime
precio decimal(10,2)
cantidad int
id_accion fk

}

Table orden {
id orden [pk]
tipo_de_orden varchar (50)
tipo_limite_porcentaje decimal(10,2)
id_accion fk
PRIMARY KEY (id_orden, tipo_de_orden)
}

Table transacciones {
id transaccion [pk]
fecha datetime
tipo varchar(50)
cantidad int
comision decimal(10,2)
monto_invertido decimal(10,2)
id_usuario fk
id_tipo_de_orden fk
id_cotizacionhistorica fk

}
Table portafolio {
id portafolio [pk]
cantidad_accion integer
valor_comprometido integer
ganancia_perdida decimal(10,2)
id_usuario fk                  
id_cuenta fk        
id_accion fk       
id_transaccion fk

}

Ref: usuario.id - broker.id
Ref: broker.id - portafolio.id
Ref: portafolio.id < accion.id
Ref: cotizacion_historica.id < accion.id
Ref: accion.id - orden.tipo_de_orden
Ref: orden.id - transacciones.id
Ref: portafolio.id < transacciones.id