SELECT a.numero_expediente, a.fecha_inicio
FROM Asuntos a
JOIN Clientes c ON a.dni_cliente = c.dni
WHERE c.direccion LIKE '%Buenos Aires%';
