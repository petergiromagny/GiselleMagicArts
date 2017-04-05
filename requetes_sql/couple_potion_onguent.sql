-----------------------------------------------
-- Procedure : couple_potion_onguent
-----------------------------------------------

-----------------------------------------------
-- Definition
-----------------------------------------------

DELIMITER |
CREATE PROCEDURE couple_potion_onguent()
BEGIN

SELECT t1.Potion, t2.Onguent
FROM ((SELECT se_compose_prepa.IDproduitFinal, ListePotion.Potion, se_compose_prepa.IDproduit
FROM se_compose_prepa
INNER JOIN ListePotion
ON se_compose_prepa.IDproduitFinal = ListePotion.ID) AS t1,
(SELECT se_compose_prepa.IDproduitFinal, ListeOnguent.Onguent, se_compose_prepa.IDproduit
FROM se_compose_prepa
INNER JOIN ListeOnguent
ON se_compose_prepa.IDproduitFinal = ListeOnguent.ID) AS t2)
WHERE t1.IDproduit = t2.IDproduit
AND(
 (SELECT COUNT(*) FROM preparation_recette WHERE ID=t1.IDproduitFinal AND IDproduit IN
  (SELECT IDproduit FROM preparation_recette WHERE ID=t2.IDproduitFinal))
  =
  (SELECT couple(t1.IDproduitFinal,t2.IDproduitFinal))
)
GROUP BY t1.IDproduitFinal;

END |
DELIMITER ;

-----------------------------------------------
-- Commande de test
-----------------------------------------------

CALL couple_potion_onguent();
