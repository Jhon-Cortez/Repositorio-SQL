USE Evento;

--Cantidad de visitantes estuvieron en el evento
SELECT count(*) AS cantidad_de_visitantes FROM Visitantes;


--Que visitantes eran estudiantes
SELECT id_visitante,nombre,tipo_entrada FROM Visitantes WHERE tipo_entrada = 'estudiante';


--El producto mas caro
SELECT nombre, costoProd FROM Productos WHERE costoProd in (SELECT max(costoProd) FROM Productos);


--Visitante con mas charlas asistidas
SELECT v.nombre,count(*) AS AsistenciaCharlas FROM Visitantes v
INNER JOIN VisitantesCharlas vc ON v.id_visitante = vc.id_visitante
GROUP BY v.nombre
ORDER BY AsistenciaCharlas desc;


--Charlas con mas visitantes

SELECT c.tipo,count(*) AS VisitantesEnLaCharla FROM Charlas c
INNER JOIN  VisitantesCharlas vc ON c.id_charla = vc.id_charla
GROUP BY c.tipo
ORDER BY VisitantesEnLaCharla desc;


