-----------------------------------------------
-- Procédure : ajouter_proposition
----------------------------------------------- 

-----------------------------------------------
-- Définition
----------------------------------------------- 

DELIMITER |
CREATE PROCEDURE ajouter_proposition(
  IN nom char(25),
  IN temperature int(11),
  IN diluant varchar(25),
  IN ingredient1 varchar(255),
  IN qte1 int(11),
  IN fraichMin1 int(11),
  IN fraichMax1 int(11),
  IN temps1 int(11),
  IN ingredient2 varchar(255),
  IN qte2 int(11),
  IN fraichMin2 int(11),
  IN fraichMax2 int(11),
  IN temps2 int(11),
  IN ingredient3 varchar(255),
  IN qte3 int(11),
  IN fraichMin3 int(11),
  IN fraichMax3 int(11),
  IN temps3 int(11),
  IN inventeur varchar(255)
)
BEGIN

SELECT IDDiluant INTO @IDdiluant
FROM Diluant
WHERE NomDiluant = diluant;

INSERT INTO Proposition(`Nom`,`Temperature`,`Diluant`,`IDPersonne`)
SELECT nom,temperature,@IDdiluant,Personne.IDPersonne
FROM Personne
WHERE Personne.Nom = inventeur;

SELECT MAX(IDProposition) INTO @IDPropo
FROM Proposition;

INSERT INTO se_compose_propo(`QteIngredient`,`FraicheurMin`,`FraicheurMax`,`Temps`,`IDProposition`,`IDproduit`)
SELECT qte1, fraichMin1,fraichMax1,temps1,@IDPropo,IDproduit
FROM Produit
WHERE NomProduit = ingredient1;

INSERT INTO se_compose_propo(`QteIngredient`,`FraicheurMin`,`FraicheurMax`,`Temps`,`IDProposition`,`IDproduit`)
SELECT qte2, fraichMin2,fraichMax2,temps2,@IDPropo,IDproduit
FROM Produit
WHERE NomProduit = ingredient2;

INSERT INTO se_compose_propo(`QteIngredient`,`FraicheurMin`,`FraicheurMax`,`Temps`,`IDProposition`,`IDproduit`)
SELECT qte3, fraichMin3,fraichMax3,temps3,@IDPropo,IDproduit
FROM Produit
WHERE NomProduit = ingredient3;

END |
DELIMITER ;

-----------------------------------------------
-- Commande de test
----------------------------------------------- 

CALL ajouter_proposition('Potion de test',100,'Vin','Sardonyx',5,10,5,10,'Azurite',10,5,1,5,'Zircon',1,5,10,2,'Merlin');
