SELECT nombre,matricula 
FROM barcos
WHERE matricula IN  
(
SELECT matricula FROM salidas WHERE destino LIKE '%Mallorca%' 
)

