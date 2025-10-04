DROP DATABASE IF EXISTS gabinete_abogados;
CREATE DATABASE gabinete_abogados;
USE gabinete_abogados;

CREATE TABLE Clientes (
    dni CHAR(10) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255)
);

CREATE TABLE Asuntos (
    numero_expediente INT PRIMARY KEY,
    dni_cliente CHAR(10) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    estado ENUM('Abierto', 'Cerrado') NOT NULL,
    FOREIGN KEY (dni_cliente) REFERENCES Clientes(dni)
);

CREATE TABLE Procuradores (
    id_procurador INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255)
);

CREATE TABLE Asuntos_Procuradores (
    numero_expediente INT NOT NULL,
    id_procurador INT NOT NULL,
    PRIMARY KEY (numero_expediente, id_procurador),
    FOREIGN KEY (numero_expediente) REFERENCES Asuntos(numero_expediente),
    FOREIGN KEY (id_procurador) REFERENCES Procuradores(id_procurador)
);