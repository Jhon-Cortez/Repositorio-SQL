USE Evento;
GO

CREATE OR ALTER PROCEDURE InsertarDatos
AS
BEGIN
	DECLARE @sql NVARCHAR(MAX);
	SET @sql = '
    -- Insert Empresa
    INSERT INTO Empresa VALUES
    (1, ''Sentech'', ''tecnologia'', 702443),
    (2, ''Edatronic'', ''comida'', 28943),
    (3, ''kmtech'', ''tecnologia'', 38562),
    (4, ''TecnoFood'', ''comida'', 12345),
    (5, ''InnovaSoft'', ''software'', 67890),
    (6, ''GadgetPro'', ''hardware'', 54321),
    (7, ''SmartSolutions'', ''iot'', 98765),
    (8, ''TechWorld'', ''tecnologia'', 11223),
    (9, ''Foodies'', ''comida'', 44556),
    (10, ''CodeCrafters'', ''software'', 77889);

    -- Insert Visitantes
    INSERT INTO Visitantes VALUES
    (1, ''Juan'', 37454893, ''juan@gmail.com'', ''estudiante'', ''visitante''),
    (2, ''Alondra'', 320287, ''aleja@gmail.com'', ''especial'', ''ponente''),
    (3, ''Alvaro'', 380247, ''alvaro@gmail.com'', ''especial'', ''responsable''),
    (4, ''Camila'', 310256, ''cami@gmail.com'', ''general'', ''visitante''),
    (5, ''Luis'', 300145, ''liu@gmail.com'', ''estudiante'', ''visitante''),
    (6, ''Sofia'', 320789, ''sofi@gmai.com'', ''general'', ''visitante''),
    (7, ''Mateo'', 310456, ''mateo@gmail.com'', ''especial'', ''ponente''),
    (8, ''Valentina'', 300987, ''valen@gmail.com'',''general'',''visitante''),
    (9, ''Antonella'', 3002948,''Anto@gmail.com'',''general'',''visitante''),
    (10, ''Jhon'',3006170,''jhon@gmail.com'',''especial'',''responsable'');

    -- Insert Pabellon
    INSERT INTO Pabellon VALUES
    (1, ''Software''),
    (2, ''Hardware''),
    (3, ''IOT''),
    (4, ''Innovacion''); 

    -- Insert Productos
    INSERT INTO Productos VALUES
    (1, 1, ''Producto A'', ''Producto tecnologia'', ''tecnologia'', 72000, 10),
    (2, 2, ''Producto B'', ''Producto tex'', ''tecnologia'', 10000, 5),
    (3, 3, ''Dron'', ''Dron volador'', ''tecnologia'', 650000, 2),
    (4, 4, ''Producto B'', ''Producto tex'', ''tecnologia'', 54000, 5),
    (5, 2, ''Producto B'', ''Producto tex'', ''tecnologia'', 23000, 7),
    (6, 1, ''Producto A'', ''Producto tecnologia'', ''tecnologia'', 10000, 3),
    (7, 2, ''Producto B'', ''Producto tex'', ''tecnologia'', 23000, 7),
    (8, 2, ''Producto B'', ''Producto tex'', ''tecnologia'', 10000, 9),
    (9, 1, ''Producto A'', ''Producto tecnologia'', ''tecnologia'', 10000, 3),
    (10, 3, ''Dron'', ''Producto tex'', ''tecnologia'', 10000, 5);

    -- Insert Stand
    INSERT INTO Stand VALUES
    (1, 1, 1, 1, 10),
    (2, 2, 2, 2, 3),
    (3, 3, 3, 3, 3),
    (4, 2, 6, 3, 3),
    (5, 1, 4, 3, 3),
    (6, 4, 8, 3, 10), 
    (7, 3, 10, 3, 3),
    (8, 2, 2, 3, 10),
    (9, 1, 5, 3, 3),
    (10, 1, 3, 3, 10);

    -- Insert Charlas
    INSERT INTO Charlas VALUES
    (1,2, ''economia'', ''economia mundial''),
    (2,2, ''educacion'', ''educacion en colombia''),
    (3,3, ''tecnologia'', ''el sena''),
    (4,3, ''Cocina'', ''En colombia''),
    (5,3, ''Celulares'', ''En Chia''),
    (6,3, ''tecnologia'', ''Evolucion''),
    (7,3,''Iforamtica'', ''Evolucion''),
    (8,3,''Pintura'', ''Paisajes''),
    (9,3,''Magisterio'', ''Pensiones''),
    (10,3, ''Mineria'', ''Medio Ambiente'');

    -- Insert VisitantesCharlas
    INSERT INTO VisitantesCharlas VALUES
    (1,2, 3),
    (2,1, 4),
    (3,2, 2),
    (4,3, 1),
    (5,4, 4),
    (6,4, 1),
    (7,8, 6),
    (8,7, 10),
    (9,5, 2),
    (10,2, 1);'
	EXEC (@sql)
END;
GO
EXEC InsertarDatos;

