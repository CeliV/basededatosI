DROP PROCEDURE IF EXISTS TotalMovimientosDelMes;

DELIMITER $$

CREATE PROCEDURE TotalMovimientosDelMes(
    IN cuenta INT,
    OUT total DECIMAL(10,2)
)
BEGIN
    DECLARE fin INT DEFAULT 0;
    DECLARE tipo_mov VARCHAR(10);
    DECLARE importe_mov DECIMAL(10,2);

    DECLARE cur_mov CURSOR FOR
        SELECT tipo, importe
        FROM movimientos
        WHERE numero_cuenta = cuenta
          AND MONTH(fecha) = MONTH(CURDATE())
          AND YEAR(fecha) = YEAR(CURDATE());

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = 1;

    SET total = 0;

    OPEN cur_mov;

    lectura: LOOP
        FETCH cur_mov INTO tipo_mov, importe_mov;
        IF fin = 1 THEN
            LEAVE lectura;
        END IF;

        IF UPPER(tipo_mov) = 'CREDITO' THEN
            SET total = total + IFNULL(importe_mov,0);
        ELSEIF UPPER(tipo_mov) = 'DEBITO' THEN
            SET total = total - IFNULL(importe_mov,0);
        END IF;
    END LOOP;

    CLOSE cur_mov;
END $$

DELIMITER ;