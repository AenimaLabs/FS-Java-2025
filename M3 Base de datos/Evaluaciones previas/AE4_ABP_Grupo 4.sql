-- Crear BD
CREATE DATABASE libreria_db;
USE libreria_db;

-- Creacion de tablas
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL,
    correo_cliente VARCHAR(100) NOT NULL UNIQUE,
    telefono_cliente VARCHAR(15) NOT NULL,
    direccion_cliente VARCHAR(255) NOT NULL,
    CHECK (CHAR_LENGTH(telefono_cliente) = 10 AND telefono_cliente REGEXP '^[0-9]+$')
);

CREATE TABLE Libros (
    id_libro INT AUTO_INCREMENT PRIMARY KEY,
    titulo_libro VARCHAR(255) NOT NULL,
    autor_libro VARCHAR(100) NOT NULL,
    precio_libro DECIMAL(10,2) NOT NULL,
    cantidad_disponible INT NOT NULL CHECK (cantidad_disponible >= 0),
    categoria_libro VARCHAR(50) NOT NULL
);

CREATE TABLE Pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    fecha_pedido DATE NOT NULL,
    total_pedido DECIMAL(10,2) NOT NULL,
    estado_pedido VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE Detalles_Pedido (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_libro INT NOT NULL,
    cantidad_libro INT NOT NULL,
    precio_libro DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_libro) REFERENCES Libros(id_libro)
);

CREATE TABLE Pagos (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    fecha_pago DATE NOT NULL,
    monto_pago DECIMAL(10,2) NOT NULL,
    metodo_pago VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido)
);

-- Modificaciones
-- Cambiar tipo de telefono_cliente a VARCHAR(20)
ALTER TABLE Clientes
MODIFY telefono_cliente VARCHAR(20);

-- Cambiar precio_libro en Libros a DECIMAL(10,3)
ALTER TABLE Libros
MODIFY precio_libro DECIMAL(10,3);

-- Agregar campo fecha_confirmacion a la tabla Pagos
ALTER TABLE Pagos
ADD fecha_confirmacion DATE;

-- Eliminar Detalles_Pedido
DROP TABLE Detalles_Pedido;

-- Insertar Clientes
INSERT INTO Clientes (nombre_cliente, correo_cliente, telefono_cliente, direccion_cliente) VALUES
('Ana Torres', 'ana.torres@email.com', '9876543210', 'Av. Libertador 101'),
('Carlos Ruiz', 'carlos.ruiz@email.com', '9123456789', 'Calle Central 202');

-- Insertar Libros
INSERT INTO Libros (titulo_libro, autor_libro, precio_libro, cantidad_disponible, categoria_libro) VALUES
('Cien años de soledad', 'Gabriel García Márquez', 19990.500, 15, 'Ficción'),
('El principito', 'Antoine de Saint-Exupéry', 8990.000, 25, 'Infantil'),
('1984', 'George Orwell', 12990.750, 10, 'Distopía');

-- Insertar Pedidos
INSERT INTO Pedidos (id_cliente, fecha_pedido, total_pedido, estado_pedido) VALUES
(1, '2025-07-10', 28980.50, 'En proceso'),
(2, '2025-07-09', 21980.75, 'Entregado');

-- Insertar Detalles_Pedido
INSERT INTO Detalles_Pedido (id_pedido, id_libro, cantidad_libro, precio_libro) VALUES
(1, 1, 1, 19990.500),
(1, 2, 1, 8990.000),
(2, 3, 1, 12990.750),
(2, 2, 1, 8990.000);

-- Insertar Pagos
INSERT INTO Pagos (id_pedido, fecha_pago, monto_pago, metodo_pago, fecha_confirmacion) VALUES
(1, '2025-07-10', 28980.50, 'Transferencia', '2025-07-10'),
(2, '2025-07-09', 21980.75, 'Tarjeta de crédito', '2025-07-09');

-- Eliminar y truncar
DROP TABLE Pagos;
TRUNCATE TABLE Pedidos;