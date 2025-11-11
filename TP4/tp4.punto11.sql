DELIMITER $$

CREATE PROCEDURE AplicarInteres(
    IN porcentaje DECIMAL(5,2),
    IN limite DECIMAL(10,2)
)
BEGIN
    DECLARE fin INT DEFAULT 0;
    DECLARE num_cuenta INT;
    DECLARE saldo_actual DECIMAL(10,2);
    DECLARE interes DECIMAL(10,2);

    DECLARE cur_cuentas CURSOR FOR
        SELECT numero_cuenta, saldo
        FROM cuentas
        WHERE saldo > limite;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = 1;

    OPEN cur_cuentas;

    aplicar: LOOP
        FETCH cur_cuentas INTO num_cuenta, saldo_actual;
        IF fin = 1 THEN
            LEAVE aplicar;
        END IF;

        SET interes = saldo_actual * (porcentaje / 100);

        INSERT INTO movimientos (numero_cuenta, fecha, tipo, importe)
        VALUES (num_cuenta, CURDATE(), 'CREDITO', interes);
    END LOOP;

    CLOSE cur_cuentas;
END $$

DELIMITER ;
