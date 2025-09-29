USE club_nautico;
SELECT socios.nombre, socios.direccion
FROM socios
JOIN barcos ON socios.id_socio = barcos.id_socio
WHERE socios.direccion LIKE '%Barcelona%'

