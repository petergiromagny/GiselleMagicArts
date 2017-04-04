CREATE VIEW Somme
(Produit, Valeur)
AS SELECT Preparation.IDproduit, SUM(se_compose_prepa.QteIngredient)
FROM (Preparation INNER JOIN se_compose_prepa ON Preparation.IDproduit = se_compose_prepa.IDproduitFinal)
WHERE Temperature > 0
GROUP BY IDproduit;

CREATE VIEW Moyenne
(Produit, Valeur)
AS SELECT AVG(Valeur)
FROM Somme;