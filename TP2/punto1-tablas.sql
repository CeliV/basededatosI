create table Socios (
	id_socio INT PRIMARY KEY auto_increment,
	nombre VARCHAR(100),
	direccion VARCHAR(255)
);

Create table Barcos (
	matricula varchar (20) primary key,
    nombre varchar (100), 
    numero_amarre int,
    cuota DECIMAL(10,2),
    id_socio INT,
    FOREIGN KEY (id_socio) REFERENCES Socios(id_socio)

CREATE TABLE Salidas (
    id_salida INT PRIMARY KEY,
    matricula VARCHAR(20),
    fecha_salida DATE,
    hora_salida TIME,
    destino VARCHAR(100),
    patron_nombre VARCHAR(100),
    patron_direccion VARCHAR(255),
    FOREIGN KEY (matricula) REFERENCES Barcos(matricula)
);
