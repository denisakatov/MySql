/*1. Проанализировать какие запросы могут выполняться наиболее часто в процессе работы приложения и добавить необходимые индексы.
 */
use vk_l;
show TABLES;
/*Создадим индекс для communities*/

select * from communities;

CREATE INDEX communities_name on communities(name);

select * from communities_users;
SELECT * from friendship;
select * from friendship_status;
/*Создадим индекс для лайков*/
select * from likes;
CREATE index likes_user_id_target_type_id on likes(user_id, target_type_id);

/*Создадим индекс для Медиа*/
select * from media;
DROP INDEX media_user_id_filename_metadata on media;
CREATE INDEX media_user_id_filename_metadata on media(user_id, filename, metadata);


SELECT * from media_types;
SELECT * from meetings;
SELECT * from meetings_users;

/*Сообщения часто используемые. Создадим индекс для сообщения, от кого и кому, а также напишем максимальное количество 1000*/
select * from messages;
DESC messages;
drop INDEX messages_from_user_id_to_user_id_body ON messages;
CREATE INDEX messages_from_user_id_to_user_id_body ON messages(from_user_id, to_user_id, body(767))

/*Создадим индекс для постов, от кого и кому, а также напишем максимальное количество 1000*/
select * from posts;
drop INDEX posts_header_body ON posts;
CREATE INDEX posts_header_body ON posts(header, body(767));


/*Создаем индекс для дня рождения, фото профиля*/
select * from profiles;
DROP INDEX profiles_birthday_photo_id_user_id on profiles;
CREATE INDEX profiles_birthday_photo_id_user_id on profiles(birthday, photo_id, user_id);


select * from target_types;

/*Создаем индекс для имени, фамилии, почты и телефона профиля*/
SELECT * from users;
CREATE INDEX users_first_name_last_name_email_phone on users(first_name, last_name, email, phone);


/*2. Задание на оконные функции
Построить запрос, который будет выводить следующие столбцы:
имя группы
среднее количество пользователей в группах
самый молодой пользователь в группе
самый пожилой пользователь в группе
общее количество пользователей в группе
всего пользователей в системе
отношение в процентах (общее количество пользователей в группе / всего пользователей в системе) * 100 */


select * from users;
select * from communities c2;
select * from communities_users;
use vk_l;
SELECT DISTINCT communities.name,                           /*имя группы*/
    COUNT(users.id) OVER () / (SELECT max(id) FROM communities) AS avarage_users, /*среднее количество пользователей в группах*/
   	MAX(profiles.birthday) OVER w AS youngest, 				/*самый молодой пользователь в группе*/
	MIN(profiles.birthday) OVER w AS oldest,				/*самый пожилой пользователь в группе*/
	COUNT(communities_users.user_id) OVER w AS total_in_community,	/*общее количество пользователей в группе*/
	COUNT(users.id) OVER () AS total,						/*всего пользователей в системе*/
	COUNT(communities_users.user_id) OVER w / COUNT(users.id) OVER () * 100 AS '%%' 	/*отношение в процентах (общее количество пользователей в группе / всего пользователей в системе) * 100 */
    FROM communities_users 
    	LEFT JOIN communities
    		ON  communities_users.community_id = communities.id
    	JOIN users 
    		ON users.id = communities_users.user_id
    	JOIN profiles profiles
    		ON profiles.user_id = users.id
	WINDOW w AS (PARTITION BY communities_users.community_id);




