/*6.	--------------- ������� ����������� ������� (���������� �����������, JOIN'�, ��������� �������);-------*/
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

-- ��������� �� ������������ � � ������������
SELECT from_user_id, to_user_id, body, create_at 
  FROM messages
    WHERE from_user_id = 5
      OR to_user_id = 5
    ORDER BY create_at DESC;
    

 -- ������� ������������ � ��������������� ���� � �������� 
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
  
-- ����� ������������ �� �������� ����� �� ����� D 
SELECT CONCAT(first_name, ' ', last_name) AS fullname  
  FROM users
  WHERE first_name LIKE 'D%';
  
 -- ���������� ���������� ��������� ������ D ��������� s
SELECT CONCAT(first_name, ' ', last_name) AS fullname  
  FROM users
  WHERE last_name RLIKE '^D.*s$';
  
  -- ���� 10 �������������, ������� ��������� ������ ���� �����.
select * from messages;
 SELECT CONCAT(first_name, ' ', last_name) AS user, 
	(SELECT COUNT(from_user_id) FROM messages WHERE messages.from_user_id = users.id) 
	AS zero_messages 
	FROM users
	ORDER BY zero_messages DESC
	LIMIT 10;
	

  -- ������� ���� �������������, ������� ��������� ������ �������
SELECT CONCAT (first_name, ' ', last_name) as person, phone, sex, estimation
	from 
		rating 
			JOIN 
		users
	on rating.user_id = users.id
			JOIN
		profiles
	on profiles.user_id = users.id;


-- ������� ��� ������ �������� ������ - ������� ��� ������� � ������� ��� ������?
SELECT profiles.sex AS SEX, 
  COUNT(rating.id) AS total_likes
  FROM rating
    JOIN profiles
      ON rating.user_id = profiles.user_id
    GROUP BY profiles.sex
    ORDER BY total_likes DESC
    LIMIT 2;
   
   
/*7. -------------------------	������������� (������� 2);   -----------------------------*/
   
   
 -- ������� ������������� � ���, ��������� �������������
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
--- ������� ������������� �� �������. ������� ����� �������. ��������������� �������� ������ ��� ��������.


CREATE OR REPLACE VIEW afisha_cinema AS
SELECT  c2.name as  name_of_cinema, c2.city_id /*��� ��������*/, c2.cinema_address, c1.city_name, c1.id/*��� ��������*/, a2.session_data, a2.session_time, a2.id as id_of_afisha /*��� ��������*/, m2.afisha_id /*��� ��������*/, m2.filename as name_of_movie
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


/*8--------------------------------�������� ��������� / ��������--------------------------------------*/
/*��������� ������ ������� ������������� ����� � ������� cities*/

DELIMITER //

DROP PROCEDURE IF EXISTS insert_to_cities//
CREATE PROCEDURE insert_to_cities (IN id INT, IN city_name VARCHAR(150))
BEGIN
  DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SET @error = '������ ������� ��������';
  INSERT INTO cities VALUES(id, city_name);
  IF @error IS NOT NULL THEN
	SELECT @error;
  END IF;
END//
DELIMITER ;
CALL insert_to_cities(1, '������');

/*�������*/

/*������� �������: ���� ������� ������ ����� ����� 10 (� ��������), �� �������� 10*/

DELIMITER //
CREATE TRIGGER before_insert_rating
BEFORE INSERT ON rating FOR EACH ROW
	BEGIN
		IF NEW.estimation > 10 THEN
			SET NEW.estimation = 10;
		END IF;
	END//
DELIMITER ;

/*���������*/
select * from rating;
INSERT INTO rating (movie_id, user_id, estimation) VALUES (1, 15, 20);


/*������� �������, ������� ������� ��� ����������, ��� �������� ������, � ������� �� ����������*/	


DELIMITER //

DROP TRIGGER IF EXISTS delete_cinemas//

CREATE TRIGGER delete_cinemas AFTER DELETE ON cities
FOR EACH ROW BEGIN
  DELETE FROM cinemas WHERE cinemas.city_id = OLD.id;
END//
DELIMITER ;

/*���������*/

DELETE FROM cities WHERE id = 2;
SELECT * from cinemas c2;
select * from;
show tables;
SELECT * from movie;


/*������� ��������, ������ �������������, ����, � ������ ������ �������� ���������*/

SELECT DISTINCT
  	filename AS '�������� ������',
  	name AS '���� ������',
  	city_name AS '������ �������������',
	AVG(estimation) over w AS '������� ������'
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
/*��� ��������*/
select AVG(rating.estimation) as "������� ������" from rating where movie_id = 2;
select * from movies;


       
  
    