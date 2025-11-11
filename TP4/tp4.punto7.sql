DELIMITER $$

CREATE PROCEDURE Extraer(
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
        SET MESSAGE_TEXT = 'El monto a extraer debe ser mayor que cero';
    ELSEIF saldo_actual IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La cuenta no existe';
    ELSEIF saldo_actual < monto THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Fondos insuficientes';
    ELSE
        INSERT INTO movimientos (numero_cuenta, fecha, tipo, importe)
        VALUES (cuenta, CURDATE(), 'DEBITO', monto);
    END IF;
END $$

DELIMITER ;