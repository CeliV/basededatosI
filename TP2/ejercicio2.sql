SELECT DISTINCT c.nombre, c.direccion
FROM Clientes c
JOIN Asuntos a ON c.dni = a.dni_cliente
JOIN Asuntos_Procuradores ap ON a.numero_expediente = ap.numero_expediente
JOIN Procuradores p ON ap.id_procurador = p.id_procurador
WHERE p.nombre = 'Carlos López';
