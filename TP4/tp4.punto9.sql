DROP TRIGGER IF EXISTS actualizar_saldo_despues_movimiento;

DELIMITER $$

CREATE TRIGGER actualizar_saldo_despues_movimiento
AFTER INSERT ON movimientos
FOR EACH ROW
BEGIN
    DECLARE saldo_anterior DECIMAL(10,2);
    DECLARE saldo_actual DECIMAL(10,2);

    SELECT saldo INTO saldo_anterior
    FROM cuentas
    WHERE numero_cuenta = NEW.numero_cuenta;

    IF UPPER(NEW.tipo) = 'CREDITO' THEN
        UPDATE cuentas
        SET saldo = saldo + NEW.importe
        WHERE numero_cuenta = NEW.numero_cuenta;
    ELSEIF UPPER(NEW.tipo) = 'DEBITO' THEN
        UPDATE cuentas
        SET saldo = saldo - NEW.importe
        WHERE numero_cuenta = NEW.numero_cuenta;
    END IF;

    SELECT saldo INTO saldo_actual
    FROM cuentas
    WHERE numero_cuenta = NEW.numero_cuenta;

    INSERT INTO historial_movimientos (numero_cuenta, numero_movimiento, saldo_anterior, saldo_actual)
    VALUES (NEW.numero_cuenta, NEW.numero_movimiento, saldo_anterior, saldo_actual);
END $$

DELIMITER ;