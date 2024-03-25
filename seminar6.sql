DROP PROCEDURE IF EXiSTS second_converter;

DELIMITER $$
CREATE PROCEDURE second_converter(num INT)
BEGIN
	CASE
		WHEN num < 60 THEN
			SELECT CONCAT(num, ' ', 'seconds') AS Result;
        WHEN num >= 60 AND num < 3600 THEN
			SELECT CONCAT_WS(' ', num DIV 60, 'minutes', MOD(num, 60), 'seconds') AS Result;
        WHEN num >= 3600 AND num < 86400 THEN
			SELECT CONCAT_WS(' ', num DIV 3600, 'hours', MOD(num, 3600) DIV 60, 'minutes', MOD(MOD(num, 3600),60), 'seconds') AS Result;
        ELSE
			SELECT CONCAT_WS(' ', num DIV 86400, 'days', MOD(num, 86400) DIV 3600, 'hours', MOD(MOD(num, 86400),3600) DIV 60, 'minutes',
                             MOD(MOD(MOD(num, 86400),3600),60), 'seconds') AS Result;
    END CASE;
END $$
DELIMITER ;

CALL second_converter(123345);
