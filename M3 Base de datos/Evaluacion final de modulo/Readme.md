# 📑 Informe de Diseño de Base de Datos

## 1. Modelo Entidad-Relación

Se diseñó un modelo ER con 4 entidades principales:
- Producto
- Proveedor
- Transaccion
- ProductoProveedor (relación M:N)

Se utilizó draw.io para representar visualmente el modelo.

## 2. Modelo Relacional

Cada entidad se transformó en una tabla:
- Claves primarias: `AUTO_INCREMENT`
- Claves foráneas: con `ON DELETE CASCADE` o `SET NULL`
- Restricciones: `CHECK`, `ENUM`, `UNIQUE`

## 3. Normalización

El modelo está en **3FN**:
- 1FN: Todos los atributos son atómicos
- 2FN: No hay dependencias parciales
- 3FN: No hay dependencias transitivas

Se usó una tabla intermedia para resolver la relación M:N.

## 4. Transacciones

Se implementó manejo de transacciones con `START TRANSACTION`, `COMMIT` y `ROLLBACK` para garantizar atomicidad.

## 5. Consultas Complejas

- JOINs para obtener información combinada
- Subconsultas para productos no vendidos
- GROUP BY con SUM() y COUNT() para análisis

## 6. Decisiones Técnicas

- Motor: InnoDB (soporta transacciones y FK)
- Codificación: utf8mb4
- Índices en campos frecuentemente consultados