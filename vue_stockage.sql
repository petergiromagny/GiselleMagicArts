CREATE VIEW vue_stockage
(Ingredient, QteTotal)
AS SELECT Produit.NomProduit, SUM(Stock.NbStock)
FROM (Stock INNER JOIN Produit ON Stock.IDproduit = Produit.IDproduit)
GROUP BY NomProduit;