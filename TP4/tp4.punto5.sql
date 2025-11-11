DELIMITER $$

CREATE PROCEDURE TotalMovimientosDelMes(
    IN cuenta INT,
    OUT total DECIMAL(10,2)
)
BEGIN
    SELECT 
        IFNULL(SUM(
            CASE 
                WHEN UPPER(tipo) = 'CREDITO' THEN importe
                WHEN UPPER(tipo) = 'DEBITO' THEN -importe
                ELSE 0
            END
        ), 0)
    INTO total
    FROM movimientos
    WHERE numero_cuenta = cuenta
      AND MONTH(fecha) = MONTH(CURDATE())
      AND YEAR(fecha) = YEAR(CURDATE());
END $$

DELIMITER ;