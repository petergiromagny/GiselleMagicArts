DELIMITER |
CREATE PROCEDURE contenu_commande(id_commande INT)

BEGIN
	SELECT contient.IDCommande, Produit.NomProduit, Recipient.NomRecipient, contient.QuantiteCommande
    FROM (contient INNER JOIN Produit ON Produit.IDproduit = contient.IDproduit INNER JOIN Recipient ON Recipient.IDrecipient = contient.IDrecipient)
	WHERE id_commande = contient.IDCommande;
END|
DELIMITER ;