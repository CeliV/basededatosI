USE banco;

-- Punto 3
CALL VerCuentas();

-- Punto 4
CALL CuentasConSaldoMayorQue(2000);

-- Punto 5
CALL TotalMovimientosDelMes(1001, @resultado);

SELECT @resultado AS 'Total del mes actual';

-- Punto 6
CALL Depositar(1001, 500.00);

SELECT numero_cuenta, saldo
FROM cuentas
WHERE numero_cuenta = 1001;

-- Punto 7
CALL Extraer(1001, 200.00);

SELECT numero_cuenta, saldo
FROM cuentas
WHERE numero_cuenta = 1001;

-- Punto 8
SELECT numero_cuenta, saldo FROM cuentas WHERE numero_cuenta = 1009;

INSERT INTO movimientos (numero_cuenta, fecha, tipo, importe)
VALUES (1009, CURDATE(), 'CREDITO', 1000.00);

SELECT numero_cuenta, saldo FROM cuentas WHERE numero_cuenta = 1009;

-- Punto 9
CALL Depositar(1001, 300.00);

SELECT numero_cuenta, saldo FROM cuentas WHERE numero_cuenta = 1001;

SELECT * FROM historial_movimientos
WHERE numero_cuenta = 1001
ORDER BY id DESC
LIMIT 1;

-- Punto 10
CALL TotalMovimientosDelMes(1001, @resultado);

SELECT @resultado AS 'Total movimientos del mes actual';

-- Punto 11
CALL AplicarInteres(2, 100000);

SELECT numero_cuenta, saldo FROM cuentas WHERE saldo > 100000;