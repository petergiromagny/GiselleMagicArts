-----------------------------------------------
-- Nom : valider_proposition
-- Type : procedure
-----------------------------------------------

-----------------------------------------------
-- Definition
-----------------------------------------------

DELIMITER |
CREATE PROCEDURE valider_proposition (IN IDpropo INT(11))
BEGIN
  
  INSERT INTO Produit (`NomProduit`)
  SELECT Nom
  FROM Proposition
  WHERE IDProposition = IDpropo;

  SELECT MAX(IDProduit) INTO @IDproduitFinal
  FROM Produit;

  INSERT INTO Preparation (`Temperature`,`IDproduit`,`IDDiluant`,`IDPersonne`)
  SELECT Temperature, @IDproduitFinal, Diluant, IDPersonne
  FROM Proposition
  WHERE IDProposition = IDpropo;

  INSERT INTO se_compose_prepa
  SELECT QteIngredient, FraicheurMin, FraicheurMax, Temps, IDproduit, @IDproduitFinal
  FROM se_compose_propo
  WHERE IDProposition = IDpropo;
  
  CALL refus_proposition(IDpropo);

END |
DELIMITER ;

-----------------------------------------------
-- Commande de test
-----------------------------------------------
