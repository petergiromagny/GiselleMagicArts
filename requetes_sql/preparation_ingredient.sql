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

SELECT DISTINCT Produit.NomProduit AS 'Nom Preparation'
FROM se_compose_prepa INNER JOIN Produit ON se_compose_prepa.IDproduitFinal = Produit.IDproduit
WHERE se_compose_prepa.IDproduitFinal IN (
  SELECT IDproduitFinal
  FROM se_compose_prepa INNER JOIN Produit ON se_compose_prepa.IDproduit = Produit.IDproduit
  WHERE Produit.NomProduit = ingredient
);

END |
DELIMITER ;

-----------------------------------------------
-- Commande de test
-----------------------------------------------

CALL preparation_ingredient('Sardonyx');
