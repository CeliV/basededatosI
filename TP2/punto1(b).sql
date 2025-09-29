SELECT nombre, cuota
FROM Barcos
WHERE id_socio 
=(
    SELECT id_socio
    FROM Socios
    WHERE nombre = 'Marta diaz'
);


-- cuales son los nombres de los barcos y sus cuotas de aquellos barcos cuyo socio se llama juan perez