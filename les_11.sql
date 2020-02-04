
/*Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, catalogs и products в таблицу logs
помещается время и дата создания записи, название таблицы, идентификатор первичного ключа и содержимое поля name.*/
DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
	data_of_logs DATETIME DEFAULT NOW(),
	name_of_table VARCHAR(255) NOT NULL,
	id_pr_key int NOT NULL,
	name_of_value VARCHAR(255) NOT NULL

) ENGINE = ARCHIVE;

CREATE TRIGGER trigger_name_of_table(
DELIMITER //

CREATE TRIGGER trigger_name_of_table AFTER INSERT ON users
FOR EACH ROW
BEGIN 
	INSERT INTO logs (name_of_table, id_pr_key, name_of_value)
	VALUES ('users', NEW.id, NEW.name);
END//


CREATE TRIGGER trigger_catalogs AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN 
	INSERT INTO logs (name_of_table, id_pr_key, name_of_value)
	VALUES ('users', NEW.id, NEW.name);
END//

CREATE TRIGGER trigger_catalogs AFTER INSERT ON products
FOR EACH ROW
BEGIN 
	INSERT INTO logs (name_of_table, id_pr_key, name_of_value)
	VALUES ('users', NEW.id, NEW.name);
END//




/*В базе данных Redis подберите коллекцию для подсчета посещений с определенных IP-адресов.*/
HSET ip_addr 127.0.0.1 1
HKEYS ip_addr
hgetall ip_addr

/*При помощи базы данных Redis решите задачу поиска имени пользователя по электронному адресу и наоборот, поиск электронного адреса пользователя по его имени.*/

SET Denis info@gmail.com
SET info@gmail.com Denis
GET info@gmail.com
#Denis

/*Организуйте хранение категорий и товарных позиций учебной базы данных shop в СУБД MongoDB.*/
db.shop.insert({category: 'Процессоры'})
db.shop.insert({category: 'Материнские платы'})

db.shop.update({category: 'Процессоры'}, {$set: { products:['Intel Core i3-8100', 'Intel Core i5-7400', 'AMD FX-8320E'] }})
db.shop.update({category: 'Материнские платы'}, {$set: { products:['ASUS ROG MAXIMUS X HERO', 'Gigabyte H310M S2H', 'MSI B250M GAMING PRO'] }})