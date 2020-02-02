/*1. ���������������� ����� ������� ����� ����������� �������� ����� � �������� ������ ���������� � �������� ����������� �������.
 */
use vk_l;
show TABLES;
/*�������� ������ ��� communities*/

select * from communities;

CREATE INDEX communities_name on communities(name);

select * from communities_users;
SELECT * from friendship;
select * from friendship_status;
/*�������� ������ ��� ������*/
select * from likes;
CREATE index likes_user_id_target_type_id on likes(user_id, target_type_id);

/*�������� ������ ��� �����*/
select * from media;
DROP INDEX media_user_id_filename_metadata on media;
CREATE INDEX media_user_id_filename_metadata on media(user_id, filename, metadata);


SELECT * from media_types;
SELECT * from meetings;
SELECT * from meetings_users;

/*��������� ����� ������������. �������� ������ ��� ���������, �� ���� � ����, � ����� ������� ������������ ���������� 1000*/
select * from messages;
DESC messages;
drop INDEX messages_from_user_id_to_user_id_body ON messages;
CREATE INDEX messages_from_user_id_to_user_id_body ON messages(from_user_id, to_user_id, body(767))

/*�������� ������ ��� ������, �� ���� � ����, � ����� ������� ������������ ���������� 1000*/
select * from posts;
drop INDEX posts_header_body ON posts;
CREATE INDEX posts_header_body ON posts(header, body(767));


/*������� ������ ��� ��� ��������, ���� �������*/
select * from profiles;
DROP INDEX profiles_birthday_photo_id_user_id on profiles;
CREATE INDEX profiles_birthday_photo_id_user_id on profiles(birthday, photo_id, user_id);


select * from target_types;

/*������� ������ ��� �����, �������, ����� � �������� �������*/
SELECT * from users;
CREATE INDEX users_first_name_last_name_email_phone on users(first_name, last_name, email, phone);


/*2. ������� �� ������� �������
��������� ������, ������� ����� �������� ��������� �������:
��� ������
������� ���������� ������������� � �������
����� ������� ������������ � ������
����� ������� ������������ � ������
����� ���������� ������������� � ������
����� ������������� � �������
��������� � ��������� (����� ���������� ������������� � ������ / ����� ������������� � �������) * 100 */


select * from users;
select * from communities c2;
select * from communities_users;
use vk_l;
SELECT DISTINCT communities.name,                           /*��� ������*/
    COUNT(users.id) OVER () / (SELECT max(id) FROM communities) AS avarage_users, /*������� ���������� ������������� � �������*/
   	MAX(profiles.birthday) OVER w AS youngest, 				/*����� ������� ������������ � ������*/
	MIN(profiles.birthday) OVER w AS oldest,				/*����� ������� ������������ � ������*/
	COUNT(communities_users.user_id) OVER w AS total_in_community,	/*����� ���������� ������������� � ������*/
	COUNT(users.id) OVER () AS total,						/*����� ������������� � �������*/
	COUNT(communities_users.user_id) OVER w / COUNT(users.id) OVER () * 100 AS '%%' 	/*��������� � ��������� (����� ���������� ������������� � ������ / ����� ������������� � �������) * 100 */
    FROM communities_users 
    	LEFT JOIN communities
    		ON  communities_users.community_id = communities.id
    	JOIN users 
    		ON users.id = communities_users.user_id
    	JOIN profiles profiles
    		ON profiles.user_id = users.id
	WINDOW w AS (PARTITION BY communities_users.community_id);




