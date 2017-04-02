-----------------------------------------------
-- Procédure : ajouter_recette
----------------------------------------------- 

-----------------------------------------------
-- Définition
----------------------------------------------- 

DELIMITER |
CREATE PROCEDURE ajouter_recette(
  IN nom char(25),
  IN temperature int(11),
  IN diluant varchar(25),
  IN IDingredient1 int(11),
  IN qte1 int(11),
  IN fraichMin1 int(11),
  IN fraichMax1 int(11),
  IN temps1 int(11),
  IN IDingredient2 int(11),
  IN qte2 int(11),
  IN fraichMin2 int(11),
  IN fraichMax2 int(11),
  IN temps2 int(11),
  IN IDingredient3 int(11),
  IN qte3 int(11),
  IN fraichMin3 int(11),
  IN fraichMax3 int(11),
  IN temps3 int(11),
  IN IDinventeur int(11)
)
BEGIN
INSERT INTO Proposition(`Nom`,`Temperature`,`Diluant`,`IDPersonne`)
VALUES (nom,temperature,diluant,IDinventeur);
SELECT MAX(IDProposition) INTO @IDPropo
FROM Proposition;
INSERT INTO se_compose_propo(`QteIngredient`,`FraicheurMin`,`FraicheurMax`,`Temps`,`IDProposition`,`IDproduit`)
VALUES
(qte1, fraichMin1,fraichMax1,temps1,@IDPropo,IDingredient1),
(qte2, fraichMin2,fraichMax2,temps2,@IDPropo,IDingredient2),
(qte3, fraichMin3,fraichMax3,temps3,@IDPropo,IDingredient3);
END |
DELIMITER ;

-----------------------------------------------
-- Commande de test
----------------------------------------------- 

CALL ajouter_recette('Potion de mort',100,'Vin',35,5,10,5,10,36,10,5,1,5,68,1,5,10,2,20);
