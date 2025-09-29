SELECT nombre, matricula, cuota,(SELECT nombre FROM socios WHERE id_socio = barcos.id_socio) AS socionombre
FROM barcos
WHERE cuota > 500;

-- SELECT columna columna columna (columna DE SOCIOS con nombre modificado) de la tabla barco donde la cuota sea mayor a 500
-- listar los barcos que tienen una cuota mayor a 500 y sus respectivos socios



