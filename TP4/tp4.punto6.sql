DELIMITER $$

CREATE PROCEDURE Depositar(
    IN cuenta INT,
    IN monto DECIMAL(10,2)
)
BEGIN
    DECLARE saldo_actual DECIMAL(10,2);
    
    SELECT saldo INTO saldo_actual
    FROM cuentas
    WHERE numero_cuenta = cuenta;
    
    IF monto <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El monto a depositar debe ser mayor que cero';
    ELSEIF saldo_actual IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La cuenta no existe';
    ELSE
        INSERT INTO movimientos (numero_cuenta, fecha, tipo, importe)
        VALUES (cuenta, CURDATE(), 'CREDITO', monto);
    END IF;
END $$

DELIMITER ;