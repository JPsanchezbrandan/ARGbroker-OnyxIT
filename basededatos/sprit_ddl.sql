Table usuario {
id usuario [pk]
nombre varchar
email varchar
contraseña varchar 
}

Table broker {
id cuenta [pk]
saldo_inicial decimal
fecha_creacion datetime
FOREIGN KEY (id_usuario) unique

}

Table accion {
id simbolo [pk]
nombre_de_empresa varchar
ultimo_operado datetime
cantidad_compra_diaria int
precio_compra_actual decimal
precio_venta_actual decimal
cantidad_venta_diaria int
apertura decimal
minimo_diario decimal
maximo_diario decimal
ultimo_cierre decimal
}

Table cotizacionhistorica {
id cotizacion [pk]
id_simbolo int
fecha datetime
precio decimal
cantidad int
id_accion fk

}

Table orden {
id orden [pk]
tipo_de_orden varchar
tipo_limite_porcentaje decimal
id_accion fk
PRIMARY KEY (id_orden, tipo_de_orden)
}

Table transacciones {
id transaccion [pk]
fecha datetime
tipo varchar
cantidad int
comision decimal
monto_invertido decimal
id_usuario fk
id_tipo_de_orden fk
id_cotizacionhistorica fk

}
Table portafolio {
id portafolio [pk]
cantidad_accion integer
valor_comprometido integer
ganancia_perdida decimal
id_usuario fk                  
id_cuenta fk        
id_simbolo fk       
id_transaccion fk

}

Ref: usuario.id - broker.id
Ref: broker.id - portafolio.id
Ref: portafolio.id < accion.id
Ref: cotizacionhistorica.id < accion.id
Ref: accion.id - orden.tipo_de_orden
Ref: orden.id - transacciones.id
Ref: portafolio.id < transacciones.id