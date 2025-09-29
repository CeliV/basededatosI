SELECT barcos.nombre , barcos.cuota , barcos.id_socio , socios.nombre AS socio_nombre
FROM barcos 
JOIN socios ON socios.id_socio = barcos.id_socio
WHERE barcos.cuota > 500 

-- Lista los barcos que tienen una cuota mayor a 500 y sus respectivos socios.