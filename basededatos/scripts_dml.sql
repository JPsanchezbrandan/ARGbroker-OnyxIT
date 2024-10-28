-- SENTENCIAS INSERT

-- 1) USUARIO

CREATE TABLE USUARIO (
id_usuario INTEGER PRIMARY KEY,
nombre VARCHAR (100) NOT NULL,
apellido VARCHAR (100) NOT NULL,
email VARCHAR (100) NOT NULL,
cuit TEXT NOT NULL,
contraseña TEXT NOT NULL,
saldo DECIMAL (10,2) NOT NULL
);


INSERT INTO USUARIO VALUES (1, 'Juan', 'Pérez', 'juan.perez@example.com', '20-12345678-9', 'password123', 5000);
INSERT INTO USUARIO VALUES (2, 'Ana', 'Gómez', 'ana.gomez@example.com', '20-98765432-1', 'password456', 1000000);


-- Actualizar saldo de ANA mediante una sentencia UPDATE 
UPDATE USUARIO 
SET saldo = 1200000, 
    email = 'ana.gomez_updated@example.com' 
WHERE id_usuario = 2;


-- Seleccionar los saldos con la función FORMAT que utiliza separadores de miles
SELECT 
id_usuario, 
nombre, 
apellido, 
email, 
cuit, 
contraseña, 
FORMAT(saldo, 0) AS saldo_formateado 
FROM USUARIO;





-- 2) ACCION

CREATE TABLE ACCION (
id_accion VARCHAR(100) PRIMARY KEY,
nombre_de_empresa VARCHAR(100),
ultimo_operado DATETIME,
cantidad_compra_diaria INT,
precio_compra_actual DECIMAL(10, 2),
precio_venta_actual DECIMAL(10, 2),
cantidad_venta_diaria INT,
apertura DECIMAL(10, 2),
minimo_diario DECIMAL(10, 2),
maximo_diario DECIMAL(10, 2),
ultimo_cierre DECIMAL(10, 2)
);


INSERT INTO ACCION (id_accion, nombre_de_empresa, ultimo_operado, cantidad_compra_diaria, precio_compra_actual, precio_venta_actual, cantidad_venta_diaria, apertura, minimo_diario, maximo_diario, ultimo_cierre) 
VALUES ('YPF', 'YPF Sociedad Anónima', NOW(), 100, 650.50, 655.00, 200, 640.00, 630.00, 670.00, 660.00);



-- Actualizar el nombre de la empresa 'YPF'
UPDATE ACCION 
SET 
    nombre_de_empresa = 'Energía Argentina S.A.' 
WHERE id_accion = 'YPF';


SELECT * FROM ACCION;




-- 3) COTIZACION HISTORICA

CREATE TABLE COTIZACION_HISTORICA (
id_cotizacion INT PRIMARY KEY,
id_accion VARCHAR(100),
fecha DATETIME,
precio DECIMAL(10, 2),
cantidad INT,
FOREIGN KEY (id_accion) REFERENCES ACCION(id_accion)
);



INSERT INTO COTIZACION_HISTORICA (id_cotizacion, id_accion, fecha, precio, cantidad) 
VALUES (1, 'YPF', '2024-10-15 10:00:00', 640.00, 100);



-- Actualizar la cotización histórica para la accion YPF
UPDATE COTIZACION_HISTORICA 
SET 
    
    precio = 820.00 
WHERE id_cotizacion = 1;



SELECT * FROM COTIZACION_HISTORICA;



-- 4) ORDEN

CREATE TABLE ORDEN (
id_orden INT,
tipo_de_orden VARCHAR(50),
tipo_limite_porcentaje DECIMAL(10, 2),
id_accion VARCHAR(100),
PRIMARY KEY (id_orden, tipo_de_orden),
FOREIGN KEY (id_accion) REFERENCES ACCION(id_accion)
);


INSERT INTO ORDEN (id_orden, tipo_de_orden, tipo_limite_porcentaje, id_accion) 
VALUES 
(1, 'Límite', 5.00, 'YPF'),
(2, 'Límite', 15.00, 'YPF');


-- Actualizar el tipo_limite_porcentaje y tipo_de_orden de una orden específica
UPDATE ORDEN 
SET 
    tipo_limite_porcentaje = 10.00, 
    tipo_de_orden = 'VENTA' 
WHERE 
    tipo_de_orden = 'Límite';



SELECT * FROM ORDEN;



-- 6) TRANSACCIONES

CREATE TABLE TRANSACCIONES (
id_transaccion INT PRIMARY KEY,
fecha DATETIME,
tipo VARCHAR(50),
cantidad INT,
comision DECIMAL(10, 2),
monto_invertido DECIMAL(10, 2),
id_usuario INT,
id_tipo_de_orden INT,
id_cotizacion INT,
FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario),
FOREIGN KEY (id_tipo_de_orden) REFERENCES ORDEN(id_orden),
FOREIGN KEY (id_cotizacion) REFERENCES COTIZACION_HISTORICA(id_cotizacion)
);


INSERT INTO TRANSACCIONES (id_transaccion, fecha, tipo, cantidad, comision, monto_invertido, id_usuario, id_tipo_de_orden, id_cotizacion) 
VALUES (1, '2024-10-15 10:30:00', 'Compra', 100, 2.50, 64000.00, 1, 1, 1);  


-- Actualizar la transacción
UPDATE TRANSACCIONES 
SET 
    cantidad = 150,                 -- Nueva cantidad
    comision = 3.00,                -- Nueva comisión
    monto_invertido = 96000.00      -- Nuevo monto invertido
WHERE 
    id_transaccion = 1;

SELECT * FROM TRANSACCIONES;


