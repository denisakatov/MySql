/*6.	--------------- скрипты характерных выборок (включающие группировки, JOIN'ы, вложенные таблицы);-------*/
use kinopoisk;
show tables;
SELECT * FROM users WHERE id = 4;

SELECT
  first_name,
  last_name,
  (SELECT image_name FROM images WHERE id = 
    (SELECT image_id FROM profiles WHERE user_id = 4)
  ) AS image,
  (SELECT sex FROM profiles WHERE user_id = 4) AS gender
  FROM users
    WHERE id = 3;
    
   
select * from images;
select * from messages m2;

-- сообщения от пользователя и к пользователю
SELECT from_user_id, to_user_id, body, create_at 
  FROM messages
    WHERE from_user_id = 5
      OR to_user_id = 5
    ORDER BY create_at DESC;
    

 -- Выводим пользователя с преобразованием пола и возраста 
SELECT 
    (SELECT CONCAT(first_name, ' ', last_name) 
      FROM users 
      WHERE id = user_id) AS friend,      
    CASE (sex)
      WHEN 'm' THEN 'man'
      WHEN 'f' THEN 'women'
    END AS sex,
    TIMESTAMPDIFF(YEAR, birthday, NOW()) AS age
  FROM profiles
  WHERE user_id = 25;
  
-- Поиск пользователя по шаблонам имени на букву D 
SELECT CONCAT(first_name, ' ', last_name) AS fullname  
  FROM users
  WHERE first_name LIKE 'D%';
  
 -- Используем регулярные выражения первая D последняя s
SELECT CONCAT(first_name, ' ', last_name) AS fullname  
  FROM users
  WHERE last_name RLIKE '^D.*s$';
  
  -- Ищем 10 пользователей, которые отправили больше всех писем.
select * from messages;
 SELECT CONCAT(first_name, ' ', last_name) AS user, 
	(SELECT COUNT(from_user_id) FROM messages WHERE messages.from_user_id = users.id) 
	AS zero_messages 
	FROM users
	ORDER BY zero_messages DESC
	LIMIT 10;
	

  -- Выведем всех пользователей, которые оставляли оценки фильмам
SELECT CONCAT (first_name, ' ', last_name) as person, phone, sex, estimation
	from 
		rating 
			JOIN 
		users
	on rating.user_id = users.id
			JOIN
		profiles
	on profiles.user_id = users.id;


-- Считаем кто больше поставил оценок - мужчины или женщины и выводим обе группы?
SELECT profiles.sex AS SEX, 
  COUNT(rating.id) AS total_likes
  FROM rating
    JOIN profiles
      ON rating.user_id = profiles.user_id
    GROUP BY profiles.sex
    ORDER BY total_likes DESC
    LIMIT 2;
   
   
/*7. -------------------------	представления (минимум 2);   -----------------------------*/
   
   
 -- Выводим пользователей и пол, используя представление
SELECT * from profiles p2;   
SELECT * from users;   
CREATE OR REPLACE VIEW user_sex AS
SELECT
  CONCAT (u.first_name, ' ', u.last_name) AS user_name,
  p.sex AS sex
FROM
  profiles AS p
JOIN
  users AS u
ON
  p.user_id = u.id;

 select * from user_sex;

use kinopoisk;
--- Сделаем представление по сложнее. Выведем Афишу городов. Индентификаторы выведены только для проверки.


CREATE OR REPLACE VIEW afisha_cinema AS
SELECT  c2.name as  name_of_cinema, c2.city_id /*для проверки*/, c2.cinema_address, c1.city_name, c1.id/*для проверки*/, a2.session_data, a2.session_time, a2.id as id_of_afisha /*для проверки*/, m2.afisha_id /*для проверки*/, m2.filename as name_of_movie
	FROM
		cinemas as c2
	JOIN
		cities as c1
	on c2.city_id = c1.id
	JOIN
		afisha as a2
	on c2.id = a2.cinema_id
	join 
		movies as m2
	on	
		m2.afisha_id = a2.id
	ORDER by city_name;

select * from afisha_cinema;


/*8--------------------------------хранимые процедуры / триггеры--------------------------------------*/
/*Обработка ошибки вставки неуникального ключа в таблицу cities*/

DELIMITER //

DROP PROCEDURE IF EXISTS insert_to_cities//
CREATE PROCEDURE insert_to_cities (IN id INT, IN city_name VARCHAR(150))
BEGIN
  DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SET @error = 'Ошибка вставки значения';
  INSERT INTO cities VALUES(id, city_name);
  IF @error IS NOT NULL THEN
	SELECT @error;
  END IF;
END//
DELIMITER ;
CALL insert_to_cities(1, 'Москва');

/*Триггер*/

/*Сделаем триггер: если человек введет число более 10 (в рейтинге), то введется 10*/

DELIMITER //
CREATE TRIGGER before_insert_rating
BEFORE INSERT ON rating FOR EACH ROW
	BEGIN
		IF NEW.estimation > 10 THEN
			SET NEW.estimation = 10;
		END IF;
	END//
DELIMITER ;

/*Проверяем*/
select * from rating;
INSERT INTO rating (movie_id, user_id, estimation) VALUES (1, 15, 20);


/*Создаем триггер, который удаляет все кинотеатра, при удалении города, в котором он расположен*/	


DELIMITER //

DROP TRIGGER IF EXISTS delete_cinemas//

CREATE TRIGGER delete_cinemas AFTER DELETE ON cities
FOR EACH ROW BEGIN
  DELETE FROM cinemas WHERE cinemas.city_id = OLD.id;
END//
DELIMITER ;

/*Проверяем*/

DELETE FROM cities WHERE id = 2;
SELECT * from cinemas c2;
select * from;
show tables;
SELECT * from movie;


/*Выведем название, страна производитель, жанр, и рейтнг фильма оконными функциями*/

SELECT DISTINCT
  	filename AS 'Название фильма',
  	name AS 'Жанр фильма',
  	city_name AS 'Страна производитель',
	AVG(estimation) over w AS 'Рейтинг фильма'
	FROM 
	  	movies
			JOIN 
		rating
	ON movies.id = rating.movie_id
			LEFT JOIN
		genres
	on genres.id = movies.genre_id
			LEFT JOIN
		countries
	on countries.id = movies.country_id
	WINDOW w AS (PARTITION BY filename);
;
/*Для проверки*/
select AVG(rating.estimation) as "рейтинг фильма" from rating where movie_id = 2;
select * from movies;


       
  
    