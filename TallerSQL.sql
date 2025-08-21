-- Sentencias DDL

CREATE TABLE Empresa (
    id_empresa INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    empresa VARCHAR(20) NOT NULL,
    nit INT NOT NULL
);

CREATE TABLE Visitantes (
    id_visitante INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    telefono INT,
    correo VARCHAR(50) NOT NULL,
    tipo_entrada VARCHAR(30) NOT NULL,
    rol VARCHAR(30) NOT NULL
);

CREATE TABLE Pabellon (
    id_pabellon INT PRIMARY KEY,
    tipo VARCHAR(30) NOT NULL
);

CREATE TABLE Productos (
    id_producto INT PRIMARY KEY,
    id_empresa INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200) NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    costoProd INT NOT NULL,
    cantidad INT NOT NULL,
    FOREIGN KEY (id_empresa) REFERENCES Empresa(id_empresa)
);

CREATE TABLE Stand (
    id_stand INT PRIMARY KEY,
    id_pabellon INT NOT NULL,
    id_producto INT NOT NULL,
    id_empresa INT NOT NULL,
    id_visitante INT NOT NULL,
    FOREIGN KEY (id_pabellon) REFERENCES Pabellon(id_pabellon),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto),
    FOREIGN KEY (id_empresa) REFERENCES Empresa(id_empresa),
    FOREIGN KEY (id_visitante) REFERENCES Visitantes(id_visitante)
);

CREATE TABLE Charlas (
    id_charla INT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    id_visitante INT NOT NULL,
    FOREIGN KEY (id_visitante) REFERENCES Visitantes(id_visitante)
);

CREATE TABLE VisitantesCharlas (
    id_visitante INT NOT NULL,
    id_charla INT NOT NULL,
    FOREIGN KEY (id_visitante) REFERENCES Visitantes(id_visitante),
    FOREIGN KEY (id_charla) REFERENCES Charlas(id_charla)
);

-- Sentencias DML

INSERT INTO Empresa VALUES
(1, 'Sentech', 'tecnologia', 702443),
(2, 'Edatronic', 'comida', 28943),
(3, 'kmtech', 'tecnologia', 38562);

INSERT INTO Visitantes VALUES
(1, 'Juan', 37454893, 'juan@gmail.com', 'estudiante', 'visitante'),
(2, 'Alondra', 320287, 'aleja@gmail.com', 'especial', 'ponente'),
(3, 'Alvaro', 380247, 'alvaro@gmail.com', 'especial', 'responsable');

INSERT INTO Pabellon VALUES
(1, 'Software'),
(2, 'Hardware'),
(3, 'IOT');

INSERT INTO Productos VALUES
(1, 1, 'Producto A', 'Producto tecnologia', 'tecnologia', 72000, 10),
(2, 2, 'Producto B', 'Producto tex', 'tecnologia', 10000, 5),
(3, 3, 'Dron', 'Dron volador', 'tecnologia', 220000, 2);

INSERT INTO Stand VALUES
(1, 1, 1, 1, 1),
(2, 2, 2, 2, 2),
(3, 3, 3, 3, 3);

INSERT INTO Charlas VALUES
(1, 'economia', 'economia mundial', 2),
(2, 'educacion', 'educacion en colombia', 2),
(3, 'tecnologia', 'el sena', 3);

INSERT INTO VisitantesCharlas VALUES
(2, 3),
(1, 1),
(1, 2);
