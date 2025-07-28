-- Tabla Clientes
CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100),
    telefono VARCHAR(20),
    email VARCHAR(100),
    direccion VARCHAR(255)
);

-- Tabla Vehículos
CREATE TABLE Vehiculos (
    id_vehiculo INT PRIMARY KEY,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    anio INT,
    precio_dia DECIMAL(10,2)
);

-- Tabla Alquileres
CREATE TABLE Alquileres (
    id_alquiler INT PRIMARY KEY,
    id_cliente INT,
    id_vehiculo INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_vehiculo) REFERENCES Vehiculos(id_vehiculo)
);

-- Tabla Pagos
CREATE TABLE Pagos (
    id_pago INT PRIMARY KEY,
    id_alquiler INT,
    monto DECIMAL(10,2),
    fecha_pago DATE,
    FOREIGN KEY (id_alquiler) REFERENCES Alquileres(id_alquiler)
);

-- Clientes
INSERT INTO Clientes (id_cliente, nombre, telefono, email, direccion) VALUES
(1, 'Juan Pérez', '555-1234', 'juan@mail.com', 'Calle 123'),
(2, 'Laura Gómez', '555-5678', 'laura@mail.com', 'Calle 456'),
(3, 'Carlos Sánchez', '555-9101', 'carlos@mail.com', 'Calle 789')
(4, 'Ana Torres', '555-2222', 'ana@mail.com', 'Calle 999');

-- Vehículos
INSERT INTO Vehiculos (id_vehiculo, marca, modelo, anio, precio_dia) VALUES
(1, 'Toyota', 'Corolla', 2020, 30.00),
(2, 'Honda', 'Civic', 2019, 28.00),
(3, 'Ford', 'Focus', 2021, 35.00);

-- Alquileres
INSERT INTO Alquileres (id_alquiler, id_cliente, id_vehiculo, fecha_inicio, fecha_fin) VALUES
(1, 1, 2, '2025-03-10', '2025-03-15'),
(2, 2, 1, '2025-03-12', '2025-03-16'),
(3, 3, 3, '2025-03-20', '2025-03-22'),
(4, 4, 2, '2025-03-22', '2025-03-25');

-- Pagos
INSERT INTO Pagos (id_pago, id_alquiler, monto, fecha_pago) VALUES
(1, 1, 150.00, '2025-03-12'),
(2, 2, 112.00, '2025-03-13'),
(3, 3, 70.00, '2025-03-20');


-- Consulta 1
SELECT nombre, telefono, email
FROM Clientes c
JOIN Alquileres a ON c.id_cliente = a.id_cliente
WHERE '2025-03-13' BETWEEN a.fecha_inicio AND a.fecha_fin;

-- Consulta 2
SELECT v.modelo, v.marca, v.precio_dia
FROM Vehiculos v
JOIN Alquileres a ON v.id_vehiculo = a.id_vehiculo
WHERE MONTH(a.fecha_inicio) = 3 AND YEAR(a.fecha_inicio) = 2025;

-- Consulta 3
SELECT c.nombre, 
       DATEDIFF(a.fecha_fin, a.fecha_inicio) AS dias_alquiler,
       v.precio_dia,
       DATEDIFF(a.fecha_fin, a.fecha_inicio) * v.precio_dia AS total
FROM Clientes c
JOIN Alquileres a ON c.id_cliente = a.id_cliente
JOIN Vehiculos v ON a.id_vehiculo = v.id_vehiculo;

-- Consulta 4
SELECT c.nombre, c.email
FROM Clientes c
LEFT JOIN Alquileres a ON c.id_cliente = a.id_cliente
LEFT JOIN Pagos p ON a.id_alquiler = p.id_alquiler
WHERE p.id_pago IS NULL;

-- Consulta 5
SELECT c.nombre, AVG(p.monto) AS promedio_pago
FROM Clientes c
JOIN Alquileres a ON c.id_cliente = a.id_cliente
JOIN Pagos p ON a.id_alquiler = p.id_alquiler
GROUP BY c.nombre;

-- Consulta 6
SELECT v.modelo, v.marca, v.precio_dia
FROM Vehiculos v
WHERE v.id_vehiculo NOT IN (
    SELECT a.id_vehiculo
    FROM Alquileres a
    WHERE '2025-03-18' BETWEEN a.fecha_inicio AND a.fecha_fin
);

-- Consulta 7
SELECT v.marca, v.modelo
FROM Vehiculos v
JOIN Alquileres a ON v.id_vehiculo = a.id_vehiculo
WHERE MONTH(a.fecha_inicio) = 3 AND YEAR(a.fecha_inicio) = 2025
GROUP BY v.id_vehiculo, v.marca, v.modelo
HAVING COUNT(*) > 1;

-- Consulta 8
SELECT c.nombre, SUM(p.monto) AS total_pagado
FROM Clientes c
JOIN Alquileres a ON c.id_cliente = a.id_cliente
JOIN Pagos p ON a.id_alquiler = p.id_alquiler
GROUP BY c.nombre;

-- Consulta 9
SELECT c.nombre, a.fecha_inicio, a.fecha_fin
FROM Clientes c
JOIN Alquileres a ON c.id_cliente = a.id_cliente
WHERE a.id_vehiculo = 3;

-- Consulta 10
SELECT c.nombre, 
       SUM(DATEDIFF(a.fecha_fin, a.fecha_inicio)) AS total_dias
FROM Clientes c
JOIN Alquileres a ON c.id_cliente = a.id_cliente
GROUP BY c.nombre
ORDER BY total_dias DESC;