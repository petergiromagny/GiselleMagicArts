-----------------------------------------------
-- Nom : preparation_ingredient
-- Type : procedure
-----------------------------------------------

-----------------------------------------------
-- Definition
-----------------------------------------------

DELIMITER |
CREATE PROCEDURE preparation_ingredient (IN ingredient varchar(255))
BEGIN

SELECT *
FROM se_compose_prepa, Produit
WHERE se_compose_prepa.IDproduit = Produit.IDproduit;

END |
DELIMITER ;

-----------------------------------------------
-- Commande de test
-----------------------------------------------
