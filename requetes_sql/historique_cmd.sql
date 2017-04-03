-----------------------------------------------
-- Procédure : historique_cmd
----------------------------------------------- 

-----------------------------------------------
-- Définition
----------------------------------------------- 

DELIMITER |

CREATE PROCEDURE historique_cmd( IN nom char(25) )

BEGIN

SELECT Commande.*, Personne.Nom, Personne.prenom, Personne.Adresse
FROM Commande, Personne
WHERE Commande.IDPersonne = Personne.IDPersonne
AND Personne.Nom LIKE nom;

END |

DELIMITER ;

-----------------------------------------------
-- Commande de test
----------------------------------------------- 

CALL historique_cmd('Naessens');