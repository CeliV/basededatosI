SELECT patron_nombre, patron_direccion
FROM Salidas
WHERE matricula IN (
    SELECT matricula
    FROM Barcos
    WHERE id_socio IN (
        SELECT id_socio
        FROM Socios
        WHERE direccion LIKE '%Barcelona%'
    )
);
-- preguntar porque no muestra nada