-- Inserciones (INSERT INTO)

-- Insertar un nuevo usuario con saldo inicial
INSERT INTO Usuario (nombre, apellido, cuil, email, contraseña, saldo)
VALUES ('Juan', 'Pérez', '20-12345678-9', 'juan.perez@example.com', 'password123', 50000);

-- Insertar una acción
INSERT INTO Accion (simbolo, nombre_empresa, ultimo_precio, cant_compra_diaria, cant_venta_diaria)
VALUES ('YPF', 'YPF Sociedad Anónima', 650.50, 100, 200);

-- Insertar una cotización histórica
INSERT INTO Cotizacion_Historica (id_accion, fecha, precio_compra, precio_venta)
VALUES (1, '2024-10-15', 640.00, 650.50);

-- Insertar una transacción de compra
INSERT INTO Transaccion (id_usuario, id_accion, fecha, tipo_operacion, cantidad_acciones, precio_operacion, comision)
VALUES (1, 1, '2024-10-16 10:00:00', 'COMPRA', 50, 650.50, 32.50);

-- Insertar en el portafolio del usuario
INSERT INTO Portafolio (id_usuario, id_accion, cantidad_acciones, precio_compra)
VALUES (1, 1, 50, 650.50);

-- Consultas de actualización (UPDATE)

-- Actualizar el último precio de una acción
UPDATE Accion SET ultimo_precio = 660.00 WHERE simbolo = 'YPF';

-- Actualizar el saldo de un usuario después de una compra
UPDATE Usuario SET saldo = saldo - 650.50 * 50 WHERE id_usuario = 1;

-- Actualizar la cantidad de acciones compradas en el día
UPDATE Accion SET cant_compra_diaria = cant_compra_diaria + 50 WHERE simbolo = 'YPF';

-- Actualizar la comisión de una transacción
UPDATE Transaccion SET comision = 35.00 WHERE id_transaccion = 1;

-- Actualizar el rendimiento de un portafolio
UPDATE Portafolio SET precio_compra = 660.00 WHERE id_portafolio = 1;

-- Consultas SELECT (para obtener información)

-- Seleccionar todos los usuarios
SELECT * FROM Usuario;

-- Obtener las acciones en el portafolio de un usuario
SELECT p.id_portafolio, a.simbolo, a.nombre_empresa, p.cantidad_acciones, a.ultimo_precio
FROM Portafolio p
JOIN Accion a ON p.id_accion = a.id_accion
WHERE p.id_usuario = 1;

-- Obtener el historial de cotizaciones de una acción
SELECT * FROM Cotizacion_Historica WHERE id_accion = 1;

-- Ver todas las transacciones de un usuario
SELECT * FROM Transaccion WHERE id_usuario = 1;

-- Obtener el saldo y total invertido del usuario
SELECT nombre, saldo,
(SELECT SUM(precio_compra * cantidad_acciones) FROM Portafolio WHERE id_usuario = 1) AS total_invertido
FROM Usuario
WHERE id_usuario = 1;

