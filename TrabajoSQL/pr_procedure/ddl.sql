USE Evento;
GO
CREATE OR ALTER PROCEDURE CrearBaseDatos
AS
BEGIN
	DECLARE @sql NVARCHAR(MAX);
	SET @sql = '
	USE EVENTO;
	CREATE TABLE Empresa(
		id_empresa INT PRIMARY KEY NOT NULL,
		nombre VARCHAR (40) NOT NULL,
		Descripcion VARCHAR (100) NOT NULL,
		NIT INT NOT NULL
	);
	CREATE TABLE Visitantes(
		id_visitante INT PRIMARY KEY NOT NULL,
		nombre VARCHAR(40) NOT NULL,
		telefono INT,
		correo VARCHAR(60),
		tipo_entrada VARCHAR(20) NOT NULL,
		rol VARCHAR(20)NOT NULL
	);
	CREATE TABLE Pabellon (
		id_pabellon INT PRIMARY KEY NOT NULL,
		tipo VARCHAR(20) NOT NULL
	);
	CREATE TABLE Productos (
		id_producto INT PRIMARY KEY NOT NULL,
		id_empresa INT NOT NULL,
		nombre VARCHAR(40) NOT NULL,
		descripcion VARCHAR(70),
		tipo VARCHAR(30) NOT NULL,
		costoProd INT NOT NULL,
		cantidad INT NOT NULL,
		FOREIGN KEY (id_empresa) REFERENCES Empresa(id_empresa)
	);
	CREATE TABLE Stand (
		id_stand INT PRIMARY KEY NOT NULL,
		id_pabellon INT NOT NULL,
		id_producto INT NOT NULL,
		id_empresa INT NOT NULL,
		id_visitante INT NOT NULL,
		FOREIGN KEY (id_pabellon) REFERENCES Pabellon(id_pabellon),
		FOREIGN KEY (id_producto) REFERENCES Productos(id_producto),
		FOREIGN KEY (id_empresa) REFERENCES Empresa(id_empresa),
		FOREIGN KEY (id_visitante) REFERENCES Visitantes(id_visitante)
	);
	CREATE TABLE Charlas(
		id_charla INT PRIMARY KEY NOT NULL,
		id_visitante INT NOT NULL,
		tipo VARCHAR(50) NOT NULL,
		descripcion VARCHAR(100) NOT NULL,
		FOREIGN KEY (id_visitante) REFERENCES Visitantes(id_visitante)
	);
	CREATE TABLE VisitantesCharlas(
		id_visicharla INT PRIMARY KEY NOT NULL,
		id_visitante INT NOT NULL,
		id_charla INT NOT NULL,
		FOREIGN KEY (id_visitante) REFERENCES Visitantes(id_visitante),
		FOREIGN KEY (id_charla) REFERENCES Charlas(id_charla)
	);'
	exec (@sql);
END;
GO
exec CrearBaseDatos;