-----------------------------------------------
-- Nom : marge_giselle
-- Type : Procedure
-----------------------------------------------

-----------------------------------------------
-- Definition
-----------------------------------------------

DELIMITER |
CREATE PROCEDURE marge_preparation()
BEGIN

SELECT req.IDproduit, req.NomProduit, (req.Prix-SUM((se_compose_prepa.QteIngredient*Produit.Prix))-req.PrixDiluant) AS 'Marge'
FROM se_compose_prepa
INNER JOIN Produit
ON se_compose_prepa.IDproduit = Produit.IDproduit
INNER JOIN (
  SELECT Preparation.IDproduit, Produit.NomProduit, Produit.Prix, Diluant.PrixDiluant
  FROM Produit
  INNER JOIN Preparation
  ON Produit.IDproduit = Preparation.IDproduit
  INNER JOIN Diluant
  ON Preparation.IDDiluant = Diluant.IDDiluant
) AS req
ON req.IDproduit = se_compose_prepa.IDproduitFinal
GROUP BY (req.IDproduit);

END |
DELIMITER ;

-----------------------------------------------
-- Commande de test
-----------------------------------------------

CALL marge_preparation();
