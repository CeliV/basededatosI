use gabinete_abogados;
SELECT p.id_procurador, p.nombre, COUNT(ap.numero_expediente) AS cantidad_asuntos
FROM Procuradores p
LEFT JOIN Asuntos_Procuradores ap ON p.id_procurador = ap.id_procurador
GROUP BY p.id_procurador, p.nombre;
