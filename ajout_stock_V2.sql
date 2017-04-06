DELIMITER |
DROP PROCEDURE IF EXISTS ajout_stock | 
CREATE PROCEDURE ajout_stock(nb int, fraicheur int, id_produit int, id_fournisseur int)

BEGIN 
	
	SET @verif = (SELECT Stock.IDstock
    FROM Stock
    WHERE 	(	(Stock.Fraicheur = fraicheur)
			AND (Stock.IDproduit = id_produit)
			AND (Stock.IDFournisseur = id_fournisseur)));
	
	IF (@verif = (SELECT Stock.IDstock
    FROM Stock
    WHERE 	(	(Stock.Fraicheur = fraicheur)
			AND (Stock.IDproduit = id_produit)
			AND (Stock.IDFournisseur = id_fournisseur))))
    THEN
    UPDATE Stock
    SET NbStock = NbStock + nb
    WHERE 	(	(Stock.Fraicheur = fraicheur)
			AND (Stock.IDproduit = id_produit)
			AND (Stock.IDFournisseur = id_fournisseur));
    ELSE
    INSERT INTO Stock (NbStock, Fraicheur, IDproduit, IDFournisseur) VALUES (nb, fraicheur, id_produit, id_fournisseur);
    END IF;
    
    SELECT *
    FROM Stock;
END|
DELIMITER ;
	