show tables;

select * from afisha;
alter TABLE afisha
		ADD CONSTRAINT afisha_cinema_id_fk
		FOREIGN KEY (cinema_id) REFERENCES cinemas (id)
		on DELETE CASCADE;
ALTER TABLE afisha DROP FOREIGN KEY afisha_cinema_id_fk;
drop CONSTRAINT afisha_cinema_id_fk;
ALTER TABLE cities MODIFY COLUMN cinema_id int(10) unsigned NULL;

DESC cinemas;
desc cities;

select * from cities;
select * from cinemas;

alter TABLE cinemas
		ADD CONSTRAINT cinemas_city_id_fk
		FOREIGN KEY (city_id) REFERENCES cities (id)
		on DELETE CASCADE;

ALTER TABLE cities DROP FOREIGN KEY cities_cinema_id_fk;


select * from countries;
select * from genres;
select * from images;
select * from languages;
select * from likes_testimonails;
alter TABLE likes_testimonails
		ADD CONSTRAINT likes_testimonail_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users (id)
		on DELETE CASCADE,
		ADD CONSTRAINT likes_testimonail_testimonial_id_fk
		FOREIGN KEY (testimonial_id) REFERENCES testimonials (id)
		on DELETE CASCADE;
select * from messages;
alter TABLE messages
		ADD CONSTRAINT messages_testimonial_from_user_id_fk
		FOREIGN KEY (from_user_id) REFERENCES users (id)
		on DELETE CASCADE;

select * from movies;
desc movies;
desc images;
select * from images;
alter TABLE movies
		ADD CONSTRAINT movies_image_id_fk
		FOREIGN KEY (image_id) REFERENCES images (id)
		on DELETE set null,
		ADD CONSTRAINT movies_afisha_id_fk
		FOREIGN KEY (afisha_id) REFERENCES afisha (id)
		on DELETE set null,
		ADD CONSTRAINT movies_country_id_fk
		FOREIGN KEY (country_id) REFERENCES countries (id)
		on DELETE set null,
		ADD CONSTRAINT movies_genre_id_fk
		FOREIGN KEY (genre_id) REFERENCES genres (id)
		on DELETE set null,
		ADD CONSTRAINT movies_trailer_id_fk
		FOREIGN KEY (trailer_id) REFERENCES trailers (id)
		on DELETE set null;
	

ALTER TABLE movies MODIFY COLUMN image_id int(10) UNSIGNED;
ALTER TABLE movies MODIFY COLUMN afisha_id int(10) UNSIGNED;
ALTER TABLE movies MODIFY COLUMN country_id int(10) UNSIGNED;
ALTER TABLE movies MODIFY COLUMN genre_id int(10) UNSIGNED;
ALTER TABLE movies MODIFY COLUMN trailer_id int(10) UNSIGNED;

select * from participant_types;
select * from participants;
alter TABLE participants
		ADD CONSTRAINT participants_city_id_fk
		FOREIGN KEY (city_id) REFERENCES city (id)
		on DELETE set null,
		ADD CONSTRAINT participants_genre_id_fk
		FOREIGN KEY (genre_id) REFERENCES genre (id)
		on DELETE set null,
		ADD CONSTRAINT participants_participants_type_id_fk
		FOREIGN KEY (participants_type_id) REFERENCES participant_types (id)
		on DELETE set null;
ALTER TABLE participants MODIFY COLUMN city_id int(10) UNSIGNED;
ALTER TABLE participants MODIFY COLUMN genre_id int(10) UNSIGNED;
ALTER TABLE participants MODIFY COLUMN participants_type_id int(10) UNSIGNED;


select * from patricipants_in_film;
desc patricipants_in_film;
alter TABLE patricipants_in_film
		ADD CONSTRAINT patricipants_in_film_movie_id_fk
		FOREIGN KEY (movie_id) REFERENCES city (id)
		on DELETE set null,
		ADD CONSTRAINT patricipants_in_film_participant_id_fk
		FOREIGN KEY (participant_id) REFERENCES participant_types (id)
		on DELETE set null;
ALTER TABLE patricipants_in_film MODIFY COLUMN movie_id int(10) UNSIGNED;
ALTER TABLE patricipants_in_film MODIFY COLUMN participant_id int(10) UNSIGNED;


select * from profiles;
desc profiles;
alter TABLE profiles
		ADD CONSTRAINT profiles_image_id_fk
		FOREIGN KEY (image_id) REFERENCES city (id)
		on DELETE set null,
		ADD CONSTRAINT profiles_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users (id)
		on DELETE CASCADE,
		ADD CONSTRAINT profiles_city_id_fk
		FOREIGN KEY (city_id) REFERENCES participant_types (id)
		on DELETE set null;
ALTER TABLE profiles MODIFY COLUMN image_id int(10) UNSIGNED;
ALTER TABLE profiles MODIFY COLUMN user_id int(10) UNSIGNED not null;
ALTER TABLE profiles MODIFY COLUMN city_id int(10) UNSIGNED;
ALTER TABLE profiles DROP FOREIGN KEY profiles_user_id_fk;


select * from rating;

alter TABLE rating
		ADD CONSTRAINT rating_movie_id_fk
		FOREIGN KEY (movie_id) REFERENCES movies (id)
		on DELETE CASCADE,
		ADD CONSTRAINT rating_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users (id)
		on DELETE CASCADE,
		ADD CONSTRAINT rating_testimonial_id_fk
		FOREIGN KEY (testimonial_id) REFERENCES testimonails (id)
		on DELETE set null;
ALTER TABLE rating MODIFY COLUMN movie_id int(10) UNSIGNED;
ALTER TABLE rating MODIFY COLUMN user_id int(10) UNSIGNED;
ALTER TABLE rating MODIFY COLUMN testimonial_id int(10) UNSIGNED;

ALTER TABLE rating DROP FOREIGN KEY rating_movie_id_fk;
ALTER TABLE rating DROP FOREIGN KEY rating_user_id_fk;
ALTER TABLE rating DROP FOREIGN KEY rating_testimonial_id_fk;




select * from testimonials;
alter TABLE testimonials
		ADD CONSTRAINT testimonials_from_user_id_fk
		FOREIGN KEY (from_user_id) REFERENCES users (id)
		on DELETE CASCADE,
		ADD CONSTRAINT testimonials_movies_id_fk
		FOREIGN KEY (movies_id) REFERENCES movies (id)
		on DELETE CASCADE;
ALTER TABLE testimonials MODIFY COLUMN from_user_id int(10) UNSIGNED;
ALTER TABLE testimonials MODIFY COLUMN movies_id int(10) UNSIGNED;


ALTER TABLE testimonials DROP FOREIGN KEY testimonials_from_user_id_fk;
ALTER TABLE testimonials DROP FOREIGN KEY testimonials_id_fk;





select * from trailers;


alter TABLE trailers
		ADD CONSTRAINT trailers_lang_id_fk
		FOREIGN KEY (lang_id) REFERENCES languages (id)
		on DELETE SET NULL;
ALTER TABLE trailers MODIFY COLUMN lang_id int(10) UNSIGNED;


select * from users;

