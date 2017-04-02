-----------------------------------------------
-- Nom : valider_recette
-- Type : trigger
-----------------------------------------------

-----------------------------------------------
-- D�finition
-----------------------------------------------

DELIMITER |
CREATE TRIGGER valider_recette
AFTER UPDATE ON Proposition
FOR EACH ROW
BEGIN

  INSERT INTO Produit (`NomProduit`)
  SELECT Nom
  FROM Proposition
  WHERE Validation = 1;

  SELECT MAX(IDProduit) INTO @IDproduitFinal
  FROM Produit;

  INSERT INTO Preparation
  SELECT Temperature, @IDproduitFinal, Diluant, IDPersonne
  FROM Proposition
  WHERE Validation = 1;

  INSERT INTO se_compose_prepa
  SELECT QteIngredient, FraicheurMin, FraicheurMax, Temps, IDproduit, @IDproduitFinal
  FROM se_compose_propo INNER JOIN Proposition ON se_compose_propo.IDProposition = Proposition.IDProposition
  WHERE Validation = 1;

END |
DELIMITER ;

-----------------------------------------------
-- Commande de test
-----------------------------------------------
