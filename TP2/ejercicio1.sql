USE gabinete_abogados;
SELECT DISTINCT p.nombre, p.direccion
FROM Procuradores p
JOIN Asuntos_Procuradores ap ON p.id_procurador = ap.id_procurador
JOIN Asuntos a ON ap.numero_expediente = a.numero_expediente
WHERE a.estado = 'Abierto';
