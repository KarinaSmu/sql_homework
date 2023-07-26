-- Создайте таблицу users_old, аналогичную таблице users.
-- Создайте процедуру, с помощью которой можно переместить любого (одного) пользователя из таблицы users в таблицу users_old.
-- (использование транзакции с выбором commit или rollback – обязательно).
DROP TABLE IF EXISTS users_old;
CREATE TABLE users_old LIKE users;
DROP PROCEDURE IF EXISTS move_to_old;
DELIMITER //
CREATE PROCEDURE move_to_old (IN user_to_move INT UNSIGNED)
BEGIN 
	DECLARE WARNING VARCHAR(25) DEFAULT 'NOT EXISTS';
    START TRANSACTION;

    IF NOT EXISTS (SELECT 1 FROM users WHERE id = user_to_move)
    THEN
        SELECT WARNING;
        ROLLBACK;
	ELSE
		INSERT INTO users_old SELECT * FROM users WHERE id = user_to_move;
		DELETE FROM users WHERE id = user_to_move;
		COMMIT;
	END IF;
END //
DELIMITER ;

CALL move_to_old (500);


-- Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток.
-- С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".

DELIMITER //
CREATE FUNCTION hello() RETURNS VARCHAR(25) DETERMINISTIC
BEGIN
    DECLARE current_hour INT;
    DECLARE greeting VARCHAR(25);
    
    SET current_hour = EXTRACT(HOUR FROM NOW());

    IF current_hour >= 6 AND current_hour < 12 THEN
        SET greeting = 'Доброе утро';
    ELSEIF current_hour >= 12 AND current_hour < 18 THEN
        SET greeting = 'Добрый день';
    ELSEIF current_hour >= 18 AND current_hour < 24 THEN
        SET greeting = 'Добрый вечер';
    ELSE
        SET greeting = 'Доброй ночи';
    END IF;

    RETURN greeting;
END //
DELIMITER ;

SELECT hello();
