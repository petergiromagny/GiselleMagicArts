CREATE VIEW Fournisseur_produit
(Fournisseur, Produits)
AS SELECT Fournisseur.Nom, Produit.NomProduit
FROM (Stock INNER JOIN Produit ON Produit.IDproduit = Stock.IDproduit
INNER JOIN Fournisseur ON Fournisseur.IDFournisseur = Stock.IDFournisseur);