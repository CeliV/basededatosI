use club_nautico;
SELECT barcos.nombre , count(*) as cant_salidas
FROM barcos
JOIN salidas ON barcos.matricula = salidas.matricula
WHERE salidas.matricula = 'ABC123'

-- ¿Cuántas salidas ha realizado el barco con matrícula 'ABC123'?