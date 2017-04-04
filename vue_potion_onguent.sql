CREATE VIEW ListePotion
(ID, Potion)
AS SELECT Preparation.IDproduit, Produit.NomProduit
FROM (Preparation INNER JOIN Produit ON Preparation.IDproduit = Produit.IDproduit)
WHERE Temperature IS NOT NULL;

CREATE VIEW ListeOnguent
(ID, Onguent)
AS SELECT Preparation.IDproduit, Produit.NomProduit
FROM (Preparation INNER JOIN Produit ON Preparation.IDproduit = Produit.IDproduit)
WHERE Temperature IS NULL;
