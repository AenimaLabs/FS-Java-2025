CREATE schema ventasjava2025;

use ventasjava2025;


CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(255),
    telefono VARCHAR(20)
);

CREATE TABLE pedidos (
    id INT PRIMARY KEY,
    cliente_id INT,
    fecha DATE,
    total DECIMAL(10 , 2 ),
    FOREIGN KEY (cliente_id)
        REFERENCES clientes (id)
        ON DELETE CASCADE
);

-- Inserta al menos cinco nuevos clientes en la tabla "clientes".
INSERT INTO clientes (id, nombre, direccion, telefono) VALUES
(1, 'Ana López', 'Calle 123, Ciudad A', '555-1234'),
(2, 'Carlos Mendoza', 'Avenida 456, Ciudad B', '555-5678'),
(3, 'Laura Torres', 'Plaza 789, Ciudad C', '555-9876'),
(4, 'Javier Pérez', 'Boulevard 101, Ciudad D', '555-4321'),
(5, 'Marta Gómez', 'Carrera 202, Ciudad E', '555-6789');

-- Inserta al menos diez nuevos pedidos en la tabla "pedidos". 
-- Asegúrate de asignar correctamente el cliente correspondiente a cada pedido utilizando la columna "cliente_id".
INSERT INTO pedidos (id, cliente_id, fecha, total) VALUES
(1, 1, '2024-10-01', 150.00),
(2, 2, '2024-10-02', 200.00),
(3, 1, '2024-10-03', 90.50),
(4, 3, '2024-10-04', 300.00),
(5, 2, '2024-10-05', 120.00),
(6, 4, '2024-10-06', 250.00),
(7, 5, '2024-10-07', 80.00),
(8, 1, '2024-10-08', 220.00),
(9, 3, '2024-10-09', 170.00),
(10, 2, '2024-10-10', 130.00);

-- Proyecta todos los clientes de la tabla "clientes" y sus respectivos pedidos.
SELECT c.id AS cliente_id, c.nombre, p.id AS pedido_id, p.fecha, p.total
FROM clientes c
JOIN pedidos p ON c.id = p.cliente_id;

-- Proyecta todos los pedidos realizados por un cliente específico, utilizando su ID.
SELECT *
FROM pedidos
WHERE cliente_id = 2;

-- Calcula el total de todos los pedidos para cada cliente.
SELECT c.id, c.nombre, SUM(p.total) AS total_pedidos
FROM clientes c
JOIN pedidos p ON c.id = p.cliente_id
GROUP BY c.id, c.nombre;

-- Actualiza la dirección de un cliente dado su "id".
UPDATE clientes
SET direccion = 'Nueva Dirección, Ciudad X'
WHERE id = 3;

-- Elimina un cliente específico de la tabla "clientes" y todos sus pedidos asociados de la tabla "pedidos".
DELETE FROM clientes WHERE id = 4;

-- Proyecta los tres clientes que han realizado más pedidos, ordenados de forma descendente por el número de pedidos.
SELECT c.id, c.nombre, COUNT(p.id) AS cantidad_pedidos
FROM clientes c
JOIN pedidos p ON c.id = p.cliente_id
GROUP BY c.id, c.nombre
ORDER BY cantidad_pedidos DESC
LIMIT 3;
