-----------------------------------------------
-- Nom : refus_proposition
-- Type : procedure
-----------------------------------------------

-----------------------------------------------
-- Definition
-----------------------------------------------

DELIMITER |
CREATE PROCEDURE refus_proposition(id_a_suppr INT)

BEGIN
	DELETE FROM `Proposition`
    WHERE `IDProposition` = id_a_suppr;
END|
DELIMITER ;

-----------------------------------------------
-- Commande de test
-----------------------------------------------

CALL refus_proposition(4);