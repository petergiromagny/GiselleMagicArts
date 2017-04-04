DELIMITER |
CREATE PROCEDURE recette_potion(id_potion INT)

BEGIN
	SELECT prod1.IDproduit, prod1.NomProduit, prod2.NomProduit as Ingrédient
    FROM (se_compose_prepa INNER JOIN Produit as prod1 ON se_compose_prepa.IDproduitFinal = prod1.IDproduit INNER JOIN Produit as prod2 ON se_compose_prepa.IDproduit = prod2.IDproduit)
	WHERE id_potion = prod1.IDproduit;
END|
DELIMITER ;