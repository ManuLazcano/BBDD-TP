DELIMITER $$
CREATE PROCEDURE cargarAlProyecto(IN id_proyecto INT, IN horas INT)
BEGIN
	DECLARE sumHorasProyecto INT;
    
	SET sumHorasProyecto = (SELECT SUM(p.horas_trabajadas) 
					FROM proyectos AS P
                    WHERE p.id_proyecto = id_proyecto
                    ) + horas;
	UPDATE proyectos AS p
	SET p.horas_trabajadas = sumHorasProyecto
	WHERE p.id_proyecto = id_proyecto;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE CargarHorasDiaria(IN id_proyecto INT, IN horas INT, IN id_participante INT)
BEGIN
    DECLARE horasDiarias INT;
    CALL cargarAlProyecto(id_proyecto, horas);
    
	SET horasDiarias = (SELECT SUM(h.diario) 
						FROM logsHoras AS h
						WHERE h.id_participante = id_participante
						) + horas;
    
	UPDATE logsHoras as h
		SET h.diario = horaDiarias
        WHERE h.id_participante = id_participante;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE CargarHorasSemanal(IN id_proyecto INT, IN horas INT, IN id_participante INT)
BEGIN
    DECLARE horasSemanal INT;
    CALL cargarAlProyecto(id_proyecto, horas);

	SET horasSemanal = (SELECT SUM(h.semanal) 
						FROM logsHoras AS h
						WHERE h.id_participante = id_participante
						) + horas;
    
	UPDATE logsHoras as h
		SET h.semanal = horaSemanal
        WHERE h.id_participante = id_participante;
END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE CargarHorasMensual(IN id_proyecto INT, IN horas INT, IN id_participante INT)
BEGIN
    DECLARE horasMensual INT;
    CALL cargarAlProyecto(id_proyecto, horas);
    
	SET horasMensual = (SELECT SUM(h.mesnsual) 
						FROM logsHoras AS h
						WHERE h.id_participante = id_participante
						) + horas;
    
	UPDATE logsHoras as h
		SET h.mensual = horasMensual
        WHERE h.id_participante = id_participante;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE CalcularLiquidacionMensual(IN id_proyecto INT)
BEGIN
	DECLARE liq INT;
    DECLARE nombreP VARCHAR(60);
    
    SET liq =	(SELECT p.horas_trabajadas
				FROM proyectos AS p
                WHERE p.id_proyecto = id_proyecto);
	SET nombreP =	(SELECT p.nombre_proyecto
					FROM proyectos AS p
					WHERE p.id_proyecto = id_proyecto);
    
    INSERT INTO liquidaciones(id_proyecto, nombre_proyecto, totalHoras)
		VALUES(id_proyecto, nombreP, liq);
	
    SELECT * FROM liquidaciones;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE Ajuste(IN id_proyecto INT, IN horas INT, IN id_participante INT)
BEGIN
	INSERT INTO ajustesLiq(id_participante, ajuste)
		VALUES(id_participante, horas);
END$$

DELIMITER ;