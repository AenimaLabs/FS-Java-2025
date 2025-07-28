-- Crear la base de datos
CREATE DATABASE recitronic;
USE recitronic;

-- Crear tabla de Clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    direccion VARCHAR(255)
);

CREATE TABLE Articulos (
    id_articulo INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    tipo_articulo VARCHAR(100) NOT NULL,
    estado VARCHAR(50) NOT NULL DEFAULT 'pendiente',
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Citas (
    id_cita INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    fecha_hora DATETIME NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Pagos (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    fecha_pago DATETIME NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Inserción de datos
INSERT INTO Clientes (nombre, telefono, direccion) VALUES
('Juan Pérez', '912345678', 'Calle 1, Santiago'),
('María López', '987654321', 'Calle 2, Valparaíso'),
('Carlos Ruiz', '976543210', 'Calle 3, Concepción'),
('Ana Torres', '923456789', 'Calle 4, La Serena'),
('Luis Martínez', '934567891', 'Calle 5, Antofagasta'),
('Paula Vega', '945678912', 'Calle 6, Temuco'),
('Jorge Fuentes', '956789123', 'Calle 7, Rancagua'),
('Carla Soto', '967891234', 'Calle 8, Iquique'),
('Pedro Reyes', '978912345', 'Calle 9, Arica'),
('Sofía Morales', '989123456', 'Calle 10, Talca'),
('Diego Castro', '998765432', 'Calle 11, Copiapó'),
('Fernanda Ríos', '911223344', 'Calle 12, Punta Arenas'),
('Ricardo Díaz', '922334455', 'Calle 13, Chillán'),
('Camila Herrera', '933445566', 'Calle 14, Ovalle'),
('Andrés Godoy', '944556677', 'Calle 15, Quillota');

INSERT INTO Articulos (id_cliente, tipo_articulo, estado) VALUES
(1, 'Notebook', 'pendiente'), (1, 'Impresora', 'pendiente'), (1, 'Teclado', 'pendiente'),
(2, 'Celular', 'pendiente'), (2, 'Router', 'pendiente'),
(3, 'Tablet', 'pendiente'),
(4, 'Monitor', 'pendiente'), (4, 'CPU', 'pendiente'), (4, 'Mouse', 'pendiente'),
(5, 'TV LCD', 'pendiente'),
(6, 'Laptop', 'pendiente'), (6, 'Cargador', 'pendiente'),
(7, 'Parlantes', 'pendiente'), (7, 'Auriculares', 'pendiente'),
(8, 'Cámara', 'pendiente'), (8, 'Videoconsola', 'pendiente'),
(9, 'Reproductor DVD', 'pendiente'),
(10, 'Pantalla LED', 'pendiente'), (10, 'Teclado', 'pendiente'),
(11, 'Disco Duro Externo', 'pendiente'), (11, 'Memoria USB', 'pendiente'),
(12, 'Control Remoto', 'pendiente'), (12, 'Switch', 'pendiente'),
(13, 'Notebook', 'pendiente'), (13, 'Scanner', 'pendiente'), (13, 'Router', 'pendiente'),
(14, 'Celular', 'pendiente'), (14, 'Tablet', 'pendiente'), (14, 'Cargador', 'pendiente'),
(15, 'Parlantes', 'pendiente'), (15, 'Impresora', 'pendiente'),
(1, 'Tablet', 'pendiente'),
(2, 'Disco Duro', 'pendiente'),
(3, 'Pantalla LED', 'pendiente'), (3, 'Laptop', 'pendiente'),
(5, 'CPU', 'pendiente'), (5, 'Cámara', 'pendiente'),
(9, 'Mouse', 'pendiente'), (9, 'Cargador', 'pendiente');

INSERT INTO Citas (id_cliente, fecha_hora) VALUES
(1, '2025-07-10 10:00:00'), (2, '2025-07-10 11:00:00'), (3, '2025-07-10 12:00:00'),
(4, '2025-07-10 13:00:00'), (5, '2025-07-10 14:00:00'), (6, '2025-07-10 15:00:00'),
(7, '2025-07-11 10:00:00'), (8, '2025-07-11 11:00:00'), (9, '2025-07-11 12:00:00'),
(10, '2025-07-11 13:00:00'), (11, '2025-07-11 14:00:00'), (12, '2025-07-11 15:00:00'),
(13, '2025-07-12 10:00:00'), (14, '2025-07-12 11:00:00'), (15, '2025-07-12 12:00:00');

INSERT INTO Pagos (id_cliente, monto, fecha_pago) VALUES
(1, 12000, '2025-07-10'), (1, 8000, '2025-07-11'),
(2, 6000, '2025-07-10'),
(3, 4000, '2025-07-10'),
(4, 10000, '2025-07-10'),
(5, 8500, '2025-07-11'),
(6, 7500, '2025-07-11'),
(7, 5000, '2025-07-11'),
(8, 9500, '2025-07-12'),
(9, 4000, '2025-07-12'),
(10, 7000, '2025-07-12'),
(11, 6500, '2025-07-12'),
(12, 6000, '2025-07-12'),
(13, 9000, '2025-07-13'),
(14, 10000, '2025-07-13'),
(15, 7500, '2025-07-13'),
(5, 5000, '2025-07-14'),
(2, 3000, '2025-07-14');

-- Actualizar información:
UPDATE Citas
SET fecha_hora = '2025-07-13 09:00:00'
WHERE id_cliente = 5;

UPDATE Articulos
SET estado = 'reciclado'
WHERE id_cliente = 1 AND estado = 'pendiente';

DELETE FROM Articulos
WHERE id_cliente = 1 AND estado = 'reciclado';

DELETE FROM Articulos
WHERE id_articulo = 3;

DELETE FROM Citas
WHERE id_cita = 12;

DELETE FROM Citas
WHERE id_cliente = 9;

-- Transacción
-- Iniciar la transacción
START TRANSACTION;

-- Paso 1: Insertar nuevo cliente
INSERT INTO Clientes (nombre, telefono, direccion)
VALUES ('Mario Rivas', '933344455', 'Calle 17, Puerto Montt');

-- Guardar el ID generado
SET @id_nuevo_cliente = LAST_INSERT_ID();

-- Paso 2: Insertar artículo para el nuevo cliente
INSERT INTO Articulos (id_cliente, tipo_articulo, estado)
VALUES (@id_nuevo_cliente, 'Videoconsola', 'pendiente');

-- Paso 3: Insertar cita para el nuevo cliente
INSERT INTO Citas (id_cliente, fecha_hora)
VALUES (@id_nuevo_cliente, '2025-07-18 10:00:00');

-- Paso 4: Actualizar estado de un artículo existente (por ejemplo, id_articulo = 2)
UPDATE Articulos
SET estado = 'reciclado'
WHERE id_articulo = 2;

-- Paso 5: Eliminar una cita cancelada (por ejemplo, id_cita = 9)
DELETE FROM Citas
WHERE id_cita = 9;

-- Si todo salió bien, confirmar
ROLLBACK;
COMMIT;