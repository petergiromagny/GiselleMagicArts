-----------------------------------------------
-- Fonction : couple
-----------------------------------------------

-----------------------------------------------
-- Definition
-----------------------------------------------

DELIMITER //
CREATE FUNCTION couple(idPotion int, idOnguent int) RETURNS int
BEGIN

DECLARE result int;

SELECT GREATEST(c1.compte,c2.compte) INTO result
FROM (
(
SELECT COUNT(*) AS compte FROM preparation_recette WHERE ID = IdPotion
) AS c1,
(
SELECT COUNT(*) AS compte FROM preparation_recette WHERE ID = idOnguent
) AS c2);

RETURN result;
END//
DELIMITER ;
