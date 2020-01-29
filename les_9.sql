/*Практическое задание по теме “Транзакции, переменные, представления”
В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. Переместите запись id = 1 из таблицы shop.users в таблицу sample.users.
Используйте транзакции.
*/
use store;

select * from users;
START TRANSACTION;
select name, id from users where id = 1;
INSERT INTO sample.users (id, name) SELECT id, name FROM store.users WHERE id = 1;
COMMIT;

/*checking the result*/
use sample;
select * from users;
show tables;

ROLLBACK;



/*Создайте представление, которое выводит название name товарной позиции из таблицы products и соответствующее название каталога name из таблицы catalogs.*/
use store;
select * from products;
select * from catalogs;
CREATE VIEW vie  as SELECT p.name, c.name as 'type' from products as p left join catalogs AS c on p.catalog_id = c.id;
select * from vie;

select name from catalogs where id = 3;

CREATE VIEW vie as 




/*Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
 С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро"
 с 12:00 до 18:00 функция должна возвращать фразу "Добрый день"
 с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".*/
delimiter //
DROP FUNCTION if EXISTS hello//
CREATE FUNCTION hello()
RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
	DECLARE hour int;
	SET hour = hour(now());
	CASE
	when hour between 6 and 11 THEN
	RETURN 'Доброе утро';
	when hour between 12 and 17 THEN
	RETURN 'Добрый день';
	when hour between 18 and 23 THEN
	RETURN 'Добрый вечер';
	when hour between 0 and 5 THEN
	RETURN 'Доброй ночи';END CASE;
END//
	
SELECT NOW(), hello()//




/*В таблице products есть два текстовых поля: name с названием товара и description с его описанием.
 * Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема.
 * Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены.
 * При попытке присвоить полям NULL-значение необходимо отменить операцию.*/

CREATE TRIGGER check_products BEFORE INSERT on products
FOR EACH ROW
BEGIN
	IF (NEW.name is NULL or NEW.description is NULL) THEN
    	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INSERT canceled';
	END IF;   
   
END//

