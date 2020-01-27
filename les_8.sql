USE vk_l;
show TABLES;
DESC communities;
select * from communities c2;
alter TABLE communities DROP FOREIGN key name;
alter TABLE communities
	ADD CONSTRAINT communities_id_fk
		FOREIGN KEY (id) REFERENCES communities_users (community_id)
		on DELETE CASCADE;

DESC communities_users;
select * from communities_users;


alter TABLE communities_users
	ADD CONSTRAINT communities_users_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users (id)
		on DELETE CASCADE;
DESC communities_users;


		
DESC users;
SELECT * from users;

Desc friendship_statuses;
select * from friendship;
select * from friendship_statuses;

alter TABLE friendship
	ADD CONSTRAINT friendship_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users (id)
		on DELETE CASCADE,
	ADD CONSTRAINT friendship_friend_id_fk
		FOREIGN KEY (friend_id) REFERENCES users (id)
		on DELETE CASCADE,
	ADD CONSTRAINT friendship_status_id_fk
		FOREIGN KEY (status_id) REFERENCES friendship_statuses (id)
		on DELETE CASCADE;
		
DESC friendship;



alter TABLE friendship DROP FOREIGN key friendship_user_id_fk;
alter TABLE friendship DROP FOREIGN key friendship_friend_id_fk;
alter TABLE friendship DROP FOREIGN key friendship_status_id_fk;
		
DESC likes;
select * from likes;
select * from target_types;

alter TABLE likes
	ADD CONSTRAINT likes_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users (id)
		on DELETE CASCADE,
	ADD CONSTRAINT likes_target_type_id_fk
		FOREIGN KEY (target_type_id) REFERENCES target_types(id)
		on DELETE CASCADE;
	

	
DESC media;
select  * from media;
select * from media_types;


alter TABLE media
	ADD CONSTRAINT media_media_type_id_fk
		FOREIGN KEY (media_type_id) REFERENCES media_types (id)
		on DELETE CASCADE,
	ADD CONSTRAINT media_id_fk
		FOREIGN KEY (user_id) REFERENCES users (id)
		on DELETE CASCADE;

	
DESC meetings;
SELECT * from meetings;

DESC meetings_users;
select * from meetings_users;

alter TABLE meetings_users
	Add CONSTRAINT meetings_users_meeting_id_fk
		FOREIGN KEY (meeting_id) REFERENCES meetings (id)
			on DELETE CASCADE,
	ADD CONSTRAINT meetings_users_user_id
		FOREIGN key (user_id) REFERENCES users(id)
			on DELETE CASCADE;
		
		
alter TABLE meetings_users DROP FOREIGN key meetings_users_meeting_id_fk;


DESC messages;
select * from messages;

alter TABLE messages
	add CONSTRAINT messages_from_user_id_fk
		FOREIGN key (from_user_id) REFERENCES users(id)
			on DELETE CASCADE,
	add CONSTRAINT messages_to_user_id_fk
		FOREIGN key (to_user_id) REFERENCES users(id)
			on DELETE CASCADE;
	
		
		
DESC profiles;
SELECT * from profiles;

ALTER TABLE profiles
	add CONSTRAINT profiles_user_id_fk
		FOREIGN key (user_id) REFERENCES users(id)
		on DELETE CASCADE;
	add CONSTRAINT profiles_photo_id_fk
		FOREIGN key (photo_id) REFERENCES media (id)
		on DELETE set null;

alter TABLE profiles MODIFY photo_id int UNSIGNED; 


DESC users;
select * FROM users;
DESC posts;
select * from posts;
	

alter TABLE posts
	add CONSTRAINT posts_user_id_fk
		FOREIGN key (user_id) REFERENCES users(id)
			on DELETE CASCADE;





/*Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.*/


/*Загружаем тестовые заказы*/
use store;

INSERT INTO orders (id, user_id, created_at) VALUES
  ('1', '1', '2019-10-05'),
  ('2', '18', '2019-11-12'),
  ('3', '3', '2019-05-20'),
  ('4', '2', '2019-02-14'),
  ('5', '4', '2019-01-12'),
  ('6', '5', '2019-08-29');
 
 /*выводим пользователей, которые заказали хотя бы раз. Используем два алгоритма.*/
 
/*Было*/
select name from users where id in (select user_id from orders);

select name from users where EXISTS (select user_id from orders where user_id = users.id);

/*Стало*/

select
	u.id, u.name, u.birthday_at
from
	users as u
JOIN 
	orders as o
on u.id = o.user_id;

/*Выведите список товаров products и разделов catalogs, который соответствует товару.*/


/* Было */
select p.name, p.catalog_id, c.name from catalogs as c join products as p where p.catalog_id = c.id;

/*После исправления*/
select p.id, p.name, p. price, c.name as catalog from products as p left join catalogs as c on p.catalog_id = c.id;

/*(по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.*/

drop TABLE if exists flights ;

CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  from_ VARCHAR(255) comment 'город отправления',
  to_ VARCHAR(255) comment 'город прибытия');

INSERT INTO flights (from_, to_) VALUES
  ('moscow', 'omsk'),
  ('kazan', 'moscow'),
  ('omsk', 'moscow'),
  ('moscow', 'kazan');
select * from flights;

drop TABLE cities;

CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  label VARCHAR(255),
  name VARCHAR(255)
  );
 
INSERT INTO cities (label, name) VALUES
  ('moscow', 'Москва'),
  ('kazan', 'Казань'),
  ('omsk', 'Омск');
 

select * from flights;
select * from cities;

/**Выводим города и из перевод*/
select
	f.id,
	cities_from.name as 'from',
	cities_to.name as 'to'
from flights as f
	left join cities as cities_from
		on f.from_ = cities_from.label
	left join cities as cities_to
		on f.to_ = cities_to.label;

