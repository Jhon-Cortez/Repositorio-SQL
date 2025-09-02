USE Evento;
GO
CREATE OR ALTER PROCEDURE MostrarReporte
AS
BEGIN
	DECLARE @sql NVARCHAR(MAX);
	SET @sql = '
    -- Cantidad de visitantes estuvieron en el evento
    SELECT COUNT(*) AS cantidad_de_visitantes 
    FROM Visitantes;

    -- Qué visitantes eran estudiantes
    SELECT id_visitante, nombre, tipo_entrada 
    FROM Visitantes 
    WHERE tipo_entrada = ''estudiante'';

    -- El producto más caro
    SELECT nombre, costoProd 
    FROM Productos 
    WHERE costoProd = (SELECT MAX(costoProd) FROM Productos);

    -- Visitante con más charlas asistidas
    SELECT TOP 1 v.nombre, COUNT(*) AS AsistenciaCharlas 
    FROM Visitantes v
    INNER JOIN VisitantesCharlas vc 
        ON v.id_visitante = vc.id_visitante
    GROUP BY v.nombre
    ORDER BY AsistenciaCharlas DESC;

    -- Charlas con más visitantes
    SELECT TOP 1 c.tipo, COUNT(*) AS VisitantesEnLaCharla 
    FROM Charlas c
    INNER JOIN VisitantesCharlas vc 
        ON c.id_charla = vc.id_charla
    GROUP BY c.tipo
    ORDER BY VisitantesEnLaCharla DESC;'
	EXEC (@sql);
END;
GO
EXEC MostrarReporte;

