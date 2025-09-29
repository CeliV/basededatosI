SELECT barcos.nombre , barcos.cuota 
FROM barcos
JOIN socios ON socios.id_socio = socios.id_socio 
WHERE socios.nombre = 'Juan Pérez'



-- ¿Cuáles son los nombres de los barcos y sus cuotas de aquellos barcos cuyo socio se llama 'Juan Pérez'?