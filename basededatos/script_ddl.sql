-- 1. Crear la base de datos
CREATE DATABASE sistema_inversiones;
USE sistema_inversiones;

-- 2. Crear tabla usuario
CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    contraseña_cifrada VARCHAR(255) NOT NULL
);

-- 3. Crear tabla cuenta_broker
CREATE TABLE cuenta_broker (
    id INT AUTO_INCREMENT PRIMARY KEY,
    saldo_inicial DECIMAL(15, 2) NOT NULL,
    fecha_creacion DATETIME NOT NULL,
    id_usuario INT,
    CONSTRAINT fk_cuenta_usuario FOREIGN KEY (id_usuario) REFERENCES usuario (id) ON DELETE CASCADE
);

-- 4. Crear tabla accion
CREATE TABLE accion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_empresa VARCHAR(100) NOT NULL,
    ultimo_operado DATETIME,
    precio_compra_actual DECIMAL(10, 2) NOT NULL,
    precio_venta_actual DECIMAL(10, 2) NOT NULL
);

-- 5. Crear tabla orden
CREATE TABLE orden (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo_orden VARCHAR(50) NOT NULL,
    tipo_limite_porcentaje DECIMAL(5, 2) NOT NULL,
    id_accion INT,
    CONSTRAINT fk_orden_accion FOREIGN KEY (id_accion) REFERENCES accion (id) ON DELETE CASCADE
);

-- 6. Crear tabla transacciones
CREATE TABLE transacciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATETIME NOT NULL,
    tipo VARCHAR(50) NOT NULL,  -- COMPRA, VENTA, etc.
    cantidad INT NOT NULL,
    comision DECIMAL(10, 2) NOT NULL,
    monto_invertido DECIMAL(15, 2) NOT NULL,
    id_usuario INT,
    id_orden INT,
    CONSTRAINT fk_transaccion_usuario FOREIGN KEY (id_usuario) REFERENCES usuario (id) ON DELETE SET NULL,
    CONSTRAINT fk_transaccion_orden FOREIGN KEY (id_orden) REFERENCES orden (id) ON DELETE SET NULL
);

-- 7. Crear tabla portafolio
CREATE TABLE portafolio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cantidad_accion INT NOT NULL,
    valor_comprometido DECIMAL(15, 2) NOT NULL,
    ganancia_perdida DECIMAL(15, 2) NOT NULL,
    id_usuario INT,
    id_cuenta INT,
    id_simbolo INT,
    CONSTRAINT fk_portafolio_usuario FOREIGN KEY (id_usuario) REFERENCES usuario (id) ON DELETE CASCADE,
    CONSTRAINT fk_portafolio_cuenta FOREIGN KEY (id_cuenta) REFERENCES cuenta_broker (id) ON DELETE CASCADE,
    CONSTRAINT fk_portafolio_simbolo FOREIGN KEY (id_simbolo) REFERENCES accion (id) ON DELETE CASCADE
);

-- 8. Crear tabla cotizaciones_historicas
CREATE TABLE cotizaciones_historicas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_accion INT,
    fecha DATETIME NOT NULL,
    precio_compra DECIMAL(10, 2) NOT NULL,
    precio_venta DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_cotizacion_accion FOREIGN KEY (id_accion) REFERENCES accion (id) ON DELETE CASCADE
);
