-- CORRECCION:
-- Mejorar constraints



Table usuario {
id_usuario INT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,  
apellido VARCHAR(100) NOT NULL,
cuit TEXT UNIQUE,                   
contraseña TEXT NOT NULL,
saldo DECIMAL(10,2)
}

Table broker {
id_cuenta INT PRIMARY KEY,  
saldo_inicial DECIMAL(10,2) NOT NULL
fecha_creacion DATETIME NOT NULL
FOREIGN KEY (id_usuario) unique
}

Table accion {
id_accion INT PRIMARY KEY,  
nombre_de_empresa VARCHAR(100) NOT NULL,
ultimo_operado DATETIME,
cantidad_compra_diaria INT NOT NULL DEFAULT 0,
precio_compra_actual DECIMAL(10,2) NOT NULL,
precio_venta_actual DECIMAL(10,2) NOT NULL,
cantidad_venta_diaria INT NOT NULL DEFAULT 0,
apertura DECIMAL(10,2) NOT NULL,
minimo_diario DECIMAL(10,2) NOT NULL,
maximo_diario DECIMAL(10,2) NOT NULL,
ultimo_cierre DECIMAL(10,2) NOT NULL
}

Table cotizacion_historica {
id_cotizacion INT PRIMARY KEY,
id_simbolo INT NOT NULL,  
fecha DATETIME NOT NULL,
precio DECIMAL(10,2) NOT NULL,
cantidad INT NOT NULL,
id_accion INT,
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
id_transaccion INT PRIMARY KEY,
fecha DATETIME NOT NULL,
tipo VARCHAR(50) NOT NULL,
cantidad INT NOT NULL,
comision DECIMAL(10,2) NOT NULL,
monto_invertido DECIMAL(10,2) NOT NULL,
id_usuario fk
id_tipo_de_orden fk
id_cotizacionhistorica fk

}
Table portafolio {
id_portafolio INT PRIMARY KEY,
cantidad_accion INT NOT NULL,
valor_comprometido INT NOT NULL,
ganancia_perdida DECIMAL(10,2) NOT NULL,
id_usuario fk                  
id_cuenta fk        
id_accion fk       
id_transaccion fk

}

Ref: usuario.id - broker.id
Ref: usuario.id < accion.id
Ref: usuario.id < transacciones.id
Ref: broker.id < portafolio.id
Ref: broker.id < accion.id
Ref: broker.id < transacciones.id
Ref: broker.id < orden.id
Ref: accion.id > transacciones.id
Ref: accion.id > portafolio.id
Ref: cotizacion_historica.id > accion.id
Ref: accion.id < orden.tipo_de_orden
Ref: orden.id - transacciones.id
Ref: portafolio.id < transacciones.id