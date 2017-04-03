-----------------------------------------------
-- Nom : valider_recette
-- Type : procedure
-----------------------------------------------

-----------------------------------------------
-- Definition
-----------------------------------------------

DELIMITER |
CREATE PROCEDURE valider_recette (IN IDpropo INT(11))
BEGIN

  UPDATE Proposition SET Validation = 1 WHERE IDProposition = IDpropo;

END |
DELIMITER ;

-----------------------------------------------
-- Commande de test
-----------------------------------------------
