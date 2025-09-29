use club_nautico;
SELECT DISTINCT barcos.nombre
FROM salidas
JOIN barcos ON salidas.matricula = barcos.matricula
WHERE salidas.destino like '%Mallorca%'


-- ¿Qué barcos han salido con destino a 'Mallorca'?