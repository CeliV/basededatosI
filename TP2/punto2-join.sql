USE gabinete_abogados;
SELECT DISTINCT p.nombre, p.direccion
FROM Procuradores p
JOIN Asuntos_Procuradores ap ON p.id_procurador = ap.id_procurador
JOIN Asuntos a ON ap.numero_expediente = a.numero_expediente
WHERE a.estado = 'Abierto';

SELECT DISTINCT c.nombre, c.direccion
FROM Clientes c
JOIN Asuntos a ON c.dni = a.dni_cliente
JOIN Asuntos_Procuradores ap ON a.numero_expediente = ap.numero_expediente
JOIN Procuradores p ON ap.id_procurador = p.id_procurador
WHERE p.nombre = 'Carlos López';

use gabinete_abogados;
SELECT p.id_procurador, p.nombre, COUNT(ap.numero_expediente) AS cantidad_asuntos
FROM Procuradores p
LEFT JOIN Asuntos_Procuradores ap ON p.id_procurador = ap.id_procurador
GROUP BY p.id_procurador, p.nombre;

SELECT a.numero_expediente, a.fecha_inicio
FROM Asuntos a
JOIN Clientes c ON a.dni_cliente = c.dni
WHERE c.direccion LIKE '%Buenos Aires%';