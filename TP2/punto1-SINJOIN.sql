SELECT nombre_matricula from barcos where numero_amarre > 10
asuntos
SELECT nombre, cuota 
from Barcos
WHERE id_socio IN ( 
SELECT id_socio
FROM Socios 
where nombre = 'Juan Perez'
);

SELECT COUNT(*) AS total_salidas
FROM Salidas
WHERE matricula = 'ABC123';

SELECT nombre, cuota
FROM Barcos
WHERE cuota >500;
SELECT nombre AS barco, cuota,(
	SELECT nombre
	FROM Socios s
    WHERE s.id_socio = b.id_socio)  AS socios
 FROM Barcos b
 WHERE cuota > 500;
    

 
     
