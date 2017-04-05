DELIMITER $

CREATE TRIGGER rupture_stock AFTER UPDATE
ON Stock FOR EACH ROW

BEGIN

IF Stock.NbStock <= 0

THEN
DELETE FROM Stock
WHERE NbStock <= 0;

END IF;

END $

DELIMITER ;