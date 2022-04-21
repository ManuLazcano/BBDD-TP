DELIMITER $$
CREATE TRIGGER after_insert_ajustesLiq
AFTER INSERT ON ajustesLiq
FOR EACH ROW
BEGIN
	DECLARE id INT;
    SET id = (SELECT a.id_ajuste FROM ajustesLiq AS a WHERE a.id_participante = NEW.id_participante);
	
    INSERT INTO logsHoras(id_participante, ajuste)
		VALUES(NEW.id_participante, NEW.ajuste);
    
    UPDATE liquidacion 
    SET id_ajuste = id 
    WHERE id_participante = new.id_participante;
END;$$
DELIMITER ;