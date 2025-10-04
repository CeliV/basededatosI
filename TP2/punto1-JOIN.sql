SELECT Socios.nombre, Socios.direccion, Barcos.nombre AS nombre_barco, Barcos.numero_amarre
FROM Socios
JOIN Barcos ON Socios.id_socio = Barcos.id_socio
WHERE Barcos.numero_amarre > 10;

SELECT barcos.nombre , barcos.cuota 
FROM barcos
JOIN socios ON socios.id_socio = socios.id_socio 
WHERE socios.nombre = 'Juan Pérez'

use club_nautico;
SELECT barcos.nombre , count(*) as cant_salidas
FROM barcos
JOIN salidas ON barcos.matricula = salidas.matricula
WHERE salidas.matricula = 'ABC123'

SELECT barcos.nombre , barcos.cuota , barcos.id_socio , socios.nombre AS socio_nombre
FROM barcos 
JOIN socios ON socios.id_socio = barcos.id_socio
WHERE barcos.cuota > 500 

use club_nautico;
SELECT DISTINCT barcos.nombre
FROM salidas
JOIN barcos ON salidas.matricula = barcos.matricula
WHERE salidas.destino like '%Mallorca%'

USE club_nautico;
SELECT socios.nombre, socios.direccion
FROM socios
JOIN barcos ON socios.id_socio = barcos.id_socio
WHERE socios.direccion LIKE '%Barcelona%'
