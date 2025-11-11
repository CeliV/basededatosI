DELIMITER $$

CREATE PROCEDURE CuentasConSaldoMayorQue(IN limite DECIMAL(10,2))
BEGIN
    SELECT 
        c.numero_cuenta AS 'Número de Cuenta',
        cl.apellido AS 'Apellido',
        cl.nombre AS 'Nombre',
        c.saldo AS 'Saldo Actual'
    FROM cuentas c
    INNER JOIN clientes cl 
        ON c.numero_cliente = cl.numero_cliente
    WHERE c.saldo > limite
    ORDER BY c.saldo DESC;
END $$

DELIMITER ;