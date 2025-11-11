DELIMITER $$

CREATE PROCEDURE VerCuentas()
BEGIN
    SELECT 
        c.numero_cuenta AS 'Número de Cuenta',
        cl.apellido AS 'Apellido',
        cl.nombre AS 'Nombre',
        c.saldo AS 'Saldo Actual'
    FROM cuentas c
    INNER JOIN clientes cl 
        ON c.numero_cliente = cl.numero_cliente
    ORDER BY cl.apellido, cl.nombre;
END $$

DELIMITER ;