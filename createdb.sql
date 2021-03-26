
--group 5 
--samima hassan
--defne Sahal
--zeynep dilay toptas



CREATE TABLE actor
(
 actor_id bigserial NOT NULL,
 f_name   varchar(50) NOT NULL,
 l_name   varchar(50) NOT NULL,
 country  varchar(50) NOT NULL,
 gender   varchar(50) NOT NULL,
 CONSTRAINT PK_table_122 PRIMARY KEY ( actor_id )
);


CREATE TABLE genre
(
 genre_id bigserial NOT NULL,
 genre    varchar(50) NOT NULL,
 CONSTRAINT PK_genre PRIMARY KEY ( genre_id )
);




CREATE TABLE movie
(
 movie_id     bigserial NOT NULL,
 title        varchar(50) NOT NULL,
 country      varchar(50) NOT NULL,
 duration     int NOT NULL,
 year_release int NOT NULL,
 movie_language varchar(50),
 price        int NOT NULL,
 CONSTRAINT PK_movie PRIMARY KEY ( movie_id )
);




CREATE TABLE actor_movie
(
 movie_id bigint NOT NULL,
 actor_id bigint NOT NULL,
 CONSTRAINT PK_actor_movie PRIMARY KEY ( movie_id, actor_id ),
 CONSTRAINT FK_179 FOREIGN KEY ( movie_id ) REFERENCES movie ( movie_id ),
 CONSTRAINT FK_185 FOREIGN KEY ( actor_id ) REFERENCES actor ( actor_id )
);




CREATE TABLE movie_genre
(
 genre_id bigint NOT NULL,
 movie_id bigint NOT NULL,
 CONSTRAINT PK_genre_movies PRIMARY KEY ( genre_id, movie_id ),
 CONSTRAINT FK_271 FOREIGN KEY ( genre_id ) REFERENCES genre ( genre_id ),
 CONSTRAINT FK_275 FOREIGN KEY ( movie_id ) REFERENCES movie ( movie_id )
);



CREATE TABLE users
(
 user_id  bigserial NOT NULL,
 f_name   varchar(50) NOT NULL,
 l_name   varchar(50) NOT NULL,
 country  varchar(50) NOT NULL,
 password varchar(50) NOT NULL,
 email    varchar(50) NOT NULL,
 CONSTRAINT PK_User PRIMARY KEY ( user_id )
);



  
CREATE TABLE subscriptions
(
 sub_id     bigserial NOT NULL,
 price      int NOT NULL,
 sub_date   date NOT NULL,
 sub_type  varchar(50) not null,
 payment_id bigint NOT NULL,
 CONSTRAINT PK_uset_sub PRIMARY KEY ( sub_id ),
 CONSTRAINT FK_278 FOREIGN KEY ( payment_id ) REFERENCES payment ( payment_id )
);


CREATE TABLE user_movie
(
 movie_id      bigint NOT NULL,
 user_id       bigint NOT NULL,
 purchase_date int NOT NULL,
 CONSTRAINT PK_user_movie PRIMARY KEY ( movie_id, user_id ),
 CONSTRAINT FK_190 FOREIGN KEY ( user_id ) REFERENCES users ( user_id ),
 CONSTRAINT FK_200 FOREIGN KEY ( movie_id ) REFERENCES movie ( movie_id )
);


CREATE TABLE trending_movies
(
 trend_id    bigserial NOT NULL,
 watch_year  int NOT NULL,
 watch_count int NOT NULL,
 user_id     bigint NOT NULL,
 movie_id    bigint NOT NULL,
 CONSTRAINT PK_trending_movies PRIMARY KEY ( trend_id ),
 CONSTRAINT FK_259 FOREIGN KEY ( user_id ) REFERENCES users ( user_id ),
 CONSTRAINT FK_262 FOREIGN KEY ( movie_id ) REFERENCES movie ( movie_id )
);





CREATE TABLE rating
(
 movie_id  bigint NOT NULL,
 user_id   bigint NOT NULL,
 rate_year int not NULL,
 rate_star numeric(10,0),
 CONSTRAINT PK_rating PRIMARY KEY ( movie_id, user_id ),
 CONSTRAINT FK_214 FOREIGN KEY ( movie_id ) REFERENCES movie ( movie_id ),
 CONSTRAINT FK_217 FOREIGN KEY ( user_id ) REFERENCES users ( user_id )
);



CREATE TABLE payment
(
 payment_id bigserial NOT NULL,
 pay_date       date NOT NULL,
 amount     int NOT NULL,
 user_id    bigint NOT NULL,
 CONSTRAINT PK_payment PRIMARY KEY ( payment_id ),
 CONSTRAINT FK_221 FOREIGN KEY ( user_id ) REFERENCES users ( user_id )
);



CREATE TABLE user_subscription
(
 user_id bigint NOT NULL,
 sub_id  bigint NOT NULL,
 CONSTRAINT PK_user_subscription PRIMARY KEY ( sub_id, user_id ),
 CONSTRAINT FK_241 FOREIGN KEY ( user_id ) REFERENCES users ( user_id ),
 CONSTRAINT FK_244 FOREIGN KEY ( sub_id ) REFERENCES subscriptions ( sub_id )
);





CREATE TABLE season
(
 season_id bigserial NOT NULL,
 s_name     varchar(50) NOT NULL,
 movie_id  bigint NOT NULL,
 CONSTRAINT PK_season PRIMARY KEY ( season_id),
 CONSTRAINT FK_285 FOREIGN KEY ( movie_id ) REFERENCES movie ( movie_id)
);


-----insert data part--------------
-- we had insert more data than 10 for queries to give answers----


INSERT INTO actor (f_name, l_name, country, gender) VALUES('yuz', 'aska', 'turkey', 'male');
INSERT INTO actor (f_name, l_name, country, gender) VALUES('basak', 'raja', 'turkey', 'female');
INSERT INTO actor (f_name, l_name, country, gender) VALUES('sada', 'ali', 'pakistan', 'female');
INSERT INTO actor (f_name, l_name, country, gender) VALUES('ahmet', 'karaca', 'turkmenistan', 'male');
INSERT INTO actor (f_name, l_name, country, gender) VALUES('nasrin', 'rata', 'afghanistan', 'female');
INSERT INTO actor (f_name, l_name, country, gender) VALUES('magr', 'sala', 'vietnam', 'male');
INSERT INTO actor (f_name, l_name, country, gender) VALUES('yunza', 'aasa', 'greek', 'female');
INSERT INTO actor (f_name, l_name, country, gender) VALUES('cha', 'ona', 'south korea', 'male');
INSERT INTO actor (f_name, l_name, country, gender) VALUES('sara', 'rad', 'iran', 'female');
INSERT INTO actor (f_name, l_name, country, gender) VALUES('rashid', 'khan', 'afghanistan', 'male');



INSERT INTO genre (genre_type) VALUES('romance');
INSERT INTO genre (genre_type) VALUES('comdey');
INSERT INTO genre (genre_type) VALUES('action');
INSERT INTO genre (genre_type) VALUES('crime');
INSERT INTO genre (genre_type) VALUES('science fiction');
INSERT INTO genre (genre_type) VALUES('advanture');
INSERT INTO genre (genre_type) VALUES('anime');
INSERT INTO genre (genre_type) VALUES('cartoon');
INSERT INTO genre (genre_type) VALUES('drama');
INSERT INTO genre (genre_type) VALUES('science fiction');
INSERT INTO genre (genre_type) VALUES('science fiction');
INSERT INTO genre (genre_type) VALUES('advanture ');






INSERT INTO movie (title, country, duration, year_release, price) 
VALUES('dangal', 'india', 137, 2016, 50);
INSERT INTO movie (title, country, duration, year_release, price)
VALUES('1992', 'USA', 140, 2017, 60);
INSERT INTO movie (title, country, duration, year_release, price)
VALUES('zendage', 'india', 120, 2015, 62);
INSERT INTO movie (title, country, duration, year_release, price)
VALUES('ironman', 'USA', 110, 2018, 70);
INSERT INTO movie (title, country, duration, year_release, price)
VALUES('hatira', 'turkey', 120, 2016, 65);
INSERT INTO movie (title, country, duration, year_release, price)
VALUES('yaparak', 'turkey', 150, 2016, 50);
INSERT INTO movie (title, country, duration, year_release, price) 
VALUES('mera hal', 'pakistan', 130, 2015, 50);
INSERT INTO movie (title, country, duration, year_release, price) 
VALUES('darkness', 'afganistan', 140, 2016, 70);
INSERT INTO movie (title, country, duration, year_release, price)
VALUES('kim bok jo', 'south korea', 160, 2017, 80);
INSERT INTO movie (title, country, duration, year_release, price)
VALUES('decent of the sun', 'south korea', 160, 2016, 90);
INSERT INTO movie (title, country, duration, year_release, price)
VALUES('decent', 'south korea', 160, 2016, 190);
INSERT INTO movie (title, country, duration, year_release, price)
VALUES('corona', 'china', 160, 2016, 350);
INSERT INTO movie (title, country, duration, year_release, price)
VALUES('virus', 'china', 160, 2016, 350);



INSERT INTO users (f_name, l_name, country, user_password, email)
VALUES('ahmet', 'saraf', 'turkey', 'qasrt', 'ahmet22@gmail.com');
INSERT INTO users (f_name, l_name, country, user_password, email)
VALUES('rashid', 'khan', '123EDT', 'afghanistan', 'rashid@gmail.com');
INSERT INTO users (f_name, l_name, country, user_password, email)
VALUES('wasal', 'kahan', 'wasal67', 'india', 'wasal23@gmail.com');
INSERT INTO users (f_name, l_name, country, user_password, email)
VALUES('sena', 'pehlevan', 'turkey', 'sena123', 'sena@gmail.com');
INSERT INTO users (f_name, l_name, country, user_password, email) 
VALUES('batol', 'rzai', 'yemen', 'bato12', 'batol@gmail.com');
INSERT INTO users (f_name, l_name, country, user_password, email) 
VALUES('riz', 'ali', 'iran', 'razi89', 'riz@gmail.com');
INSERT INTO users (f_name, l_name, country, user_password, email) 
VALUES('shafa', 'wafa', 'pakistan', 'wad45', 'wafa23@gmail.com');
INSERT INTO users (f_name, l_name, country, user_password, email)
VALUES('bokjo', 'kii', 'south korea', 'kii123', '123kii@gmail.com');
INSERT INTO users (f_name, l_name, country, user_password, email)
VALUES('ohsi', 'hii', 'vitnam', 'oshii45', 'hii@gmail.com');
INSERT INTO users (f_name, l_name, country, user_password, email) 
VALUES('rozha', 'baha', 'comeeron', 'baha@gmail.com', 'baha@gmail.com');
INSERT INTO users (f_name, l_name, country, user_password, email) 
VALUES('shafa', 'ware', 'iraq', 'shag45', 'shafa23@hotmail.com');
INSERT INTO users (f_name, l_name, country, user_password, email) 
VALUES('ronaldo', 'cris', 'portugal', 'ehehehe', 'cristiano@gmail.com');
INSERT INTO users (f_name, l_name, country, user_password, email) 
VALUES('trump', 'eheh', 'us', 'shag45', 'trump@hotmail.com');



INSERT INTO subscriptions(price, sub_date, sub_type, payment_id) VALUES(100, '2013-06-01', 'weekly',1);
INSERT INTO subscriptions (price, sub_date, sub_type, payment_id) VALUES(100, '2015-07-05', 'weekly',1);
INSERT INTO subscriptions (price, sub_date, sub_type, payment_id) VALUES(300, '2016-06-04', 'monthly',2);
INSERT INTO subscriptions(price, sub_date, sub_type, payment_id) VALUES(300, '2018-06-02', 'monthly',3);
INSERT INTO subscriptions(price, sub_date, sub_type, payment_id)VALUES(300, '2019-05-01', 'monthly',3);
INSERT INTO subscriptions (price, sub_date, sub_type, payment_id) VALUES(500, '2018-09-05', 'annual',5);
INSERT INTO subscriptions (price, sub_date, sub_type, payment_id) VALUES(500, '2017-03-06', 'annual',4);
INSERT INTO subscriptions (price, sub_date, sub_type, payment_id) VALUES(100, '2019-05-01', 'weekly',4);
INSERT INTO subscriptions (price, sub_date, sub_type, payment_id) VALUES(100, '2018-09-05', 'weekly',3);
INSERT INTO subscriptions (price, sub_date, sub_type, payment_id) VALUES(300, '2017-03-06', 'monthly',3);


INSERT INTO actor_movie (movie_id, actor_id) VALUES(1, 1);
INSERT INTO actor_movie (movie_id, actor_id) VALUES(2, 7);
INSERT INTO actor_movie (movie_id, actor_id) VALUES(2, 3);
INSERT INTO actor_movie (movie_id, actor_id) VALUES(4, 5);
INSERT INTO actor_movie (movie_id, actor_id) VALUES(1, 5);
INSERT INTO actor_movie (movie_id, actor_id) VALUES(6, 7);
INSERT INTO actor_movie (movie_id, actor_id) VALUES(3, 9);
INSERT INTO actor_movie (movie_id, actor_id) VALUES(7, 6);
INSERT INTO actor_movie (movie_id, actor_id) VALUES(9, 2);
INSERT INTO actor_movie (movie_id, actor_id) VALUES(5, 4);
INSERT INTO actor_movie (movie_id, actor_id) VALUES(2 ,4);
INSERT INTO actor_movie (movie_id, actor_id) VALUES(3, 2);



INSERT INTO movie_genre (genre_id, movie_id) VALUES(1, 2);
INSERT INTO movie_genre (genre_id, movie_id) VALUES(2, 1);
INSERT INTO movie_genre (genre_id, movie_id) VALUES(3, 3);
INSERT INTO movie_genre (genre_id, movie_id) VALUES(4, 4);
INSERT INTO movie_genre (genre_id, movie_id) VALUES(5, 3);
INSERT INTO movie_genre (genre_id, movie_id) VALUES(6, 8);
INSERT INTO movie_genre (genre_id, movie_id) VALUES(7, 3);
INSERT INTO movie_genre (genre_id, movie_id) VALUES(8, 4);
INSERT INTO movie_genre (genre_id, movie_id) VALUES(9, 4);
INSERT INTO movie_genre (genre_id, movie_id) VALUES(2, 4);
INSERT INTO movie_genre (genre_id, movie_id) VALUES(5, 7);
INSERT INTO movie_genre (genre_id, movie_id) VALUES(5, 10);
INSERT INTO movie_genre (genre_id, movie_id) VALUES(5, 5);
INSERT INTO movie_genre (genre_id, movie_id) VALUES(5, 9);
INSERT INTO movie_genre (genre_id, movie_id) VALUES(5, 2);
INSERT INTO movie_genre (genre_id, movie_id) VALUES(5, 1);
INSERT INTO movie_genre (genre_id, movie_id) VALUES(2, 10);
INSERT INTO movie_genre (genre_id, movie_id) VALUES(2, 5);
INSERT INTO movie_genre (genre_id, movie_id) VALUES(2, 9);
INSERT INTO movie_genre (genre_id, movie_id) VALUES(9, 2);
INSERT INTO movie_genre (genre_id, movie_id) VALUES(9, 1);
INSERT INTO movie_genre (genre_id, movie_id) VALUES(10, 12);
INSERT INTO movie_genre (genre_id, movie_id) VALUES(10, 13);
INSERT INTO movie_genre (genre_id, movie_id) VALUES(11, 12);
INSERT INTO movie_genre (genre_id, movie_id) VALUES(11, 13);






INSERT INTO payment (pay_date, amount, user_id) VALUES('2017-03-06', 50, 7);
INSERT INTO payment (pay_date, amount, user_id) VALUES('2017-03-06', 70, 6);
INSERT INTO payment (pay_date, amount, user_id) VALUES('2017-03-06', 100, 2);
INSERT INTO payment (pay_date, amount, user_id) VALUES('2017-03-06', 250, 1);
INSERT INTO payment (pay_date, amount, user_id) VALUES('2017-03-06', 30, 3);
INSERT INTO payment (pay_date, amount, user_id) VALUES('2017-03-06', 45, 3);
INSERT INTO payment (pay_date, amount, user_id) VALUES('2017-03-06', 60, 1);
INSERT INTO payment (pay_date, amount, user_id) VALUES('2017-03-06', 80, 3);
INSERT INTO payment (pay_date, amount, user_id) VALUES('2017-03-06', 70, 2);
INSERT INTO payment (pay_date, amount, user_id) VALUES('2017-03-06', 68, 1);





INSERT INTO rating (movie_id, user_id, rate_year, rate_star) VALUES(1, 5, 2017, 9);
INSERT INTO rating (movie_id, user_id, rate_year, rate_star) VALUES(3, 4, 2017, 9);
INSERT INTO rating (movie_id, user_id, rate_year, rate_star) VALUES(5, 4, 2017, 2);
INSERT INTO rating (movie_id, user_id, rate_year, rate_star) VALUES(6, 3, 2017, 3);
INSERT INTO rating (movie_id, user_id, rate_year, rate_star) VALUES(3, 3, 2017, 6);
INSERT INTO rating (movie_id, user_id, rate_year, rate_star) VALUES(8, 3, 2017, 5);
INSERT INTO rating (movie_id, user_id, rate_year, rate_star) VALUES(5, 2, 2017, 8);
INSERT INTO rating (movie_id, user_id, rate_year, rate_star) VALUES(4, 1, 2017, 9);
INSERT INTO rating (movie_id, user_id, rate_year, rate_star) VALUES(9, 3, 2017, 7);
INSERT INTO rating (movie_id, user_id, rate_year, rate_star) VALUES(6, 4, 2014, 9);
INSERT INTO rating (movie_id, user_id, rate_year, rate_star) VALUES(4, 6, 2016, 7);
INSERT INTO rating (movie_id, user_id, rate_year, rate_star) VALUES(8, 6, 2017, 7);
INSERT INTO rating (movie_id, user_id, rate_year, rate_star) VALUES(7, 6, 2016, 7);
INSERT INTO rating (movie_id, user_id, rate_year, rate_star) VALUES(5, 9, 2017, 8);
INSERT INTO rating (movie_id, user_id, rate_year, rate_star) VALUES(8, 1, 2017, 9);
INSERT INTO rating (movie_id, user_id, rate_year, rate_star) VALUES(1, 1, 2016, 7);
INSERT INTO rating (movie_id, user_id, rate_year, rate_star) VALUES(2, 2, 2014, 9);
INSERT INTO rating (movie_id, user_id, rate_year, rate_star) VALUES(4, 3, 2016, 7);
INSERT INTO rating (movie_id, user_id, rate_year, rate_star) VALUES(7, 4, 2017, 7);
INSERT INTO rating (movie_id, user_id, rate_year, rate_star) VALUES(9, 5, 2016, 7);
INSERT INTO rating (movie_id, user_id, rate_year, rate_star) VALUES(3, 5, 2016, 7);
INSERT INTO rating (movie_id, user_id, rate_year, rate_star) VALUES(9, 9, 2016, null);
INSERT INTO rating (movie_id, user_id, rate_year, rate_star) VALUES(4, 2, 2016, null);
INSERT INTO rating (movie_id, user_id, rate_year, rate_star) VALUES(7, 8, 2016, null);





INSERT INTO user_movie (movie_id, user_id, purchase_date) VALUES(1,1 , 2016);
INSERT INTO user_movie (movie_id, user_id, purchase_date) VALUES(3, 5, 2017);
INSERT INTO user_movie (movie_id, user_id, purchase_date) VALUES(4, 5, 2016);
INSERT INTO user_movie (movie_id, user_id, purchase_date) VALUES(3, 9, 2017);
INSERT INTO user_movie (movie_id, user_id, purchase_date) VALUES(6, 8, 2018);
INSERT INTO user_movie (movie_id, user_id, purchase_date) VALUES(7, 3, 2018);
INSERT INTO user_movie (movie_id, user_id, purchase_date) VALUES(8, 7, 2017);
INSERT INTO user_movie (movie_id, user_id, purchase_date) VALUES(9, 3, 2015);
INSERT INTO user_movie (movie_id, user_id, purchase_date) VALUES(4, 6, 2018);
INSERT INTO user_movie (movie_id, user_id, purchase_date) VALUES(3, 4, 2019);
INSERT INTO user_movie (movie_id, user_id, purchase_date) VALUES(2, 2, 2020);
INSERT INTO user_movie (movie_id, user_id, purchase_date) VALUES(11, 3, 2020);
INSERT INTO user_movie (movie_id, user_id, purchase_date) VALUES(10, 3, 2020);
INSERT INTO user_movie (movie_id, user_id, purchase_date) VALUES(11, 4, 2020);
INSERT INTO user_movie (movie_id, user_id, purchase_date) VALUES(10, 4, 2020);
INSERT INTO user_movie (movie_id, user_id, purchase_date) VALUES(2, 5, 2018);
INSERT INTO user_movie (movie_id, user_id, purchase_date) VALUES(1, 7, 2017);
INSERT INTO user_movie (movie_id, user_id, purchase_date) VALUES(9, 5, 2015);
INSERT INTO user_movie (movie_id, user_id, purchase_date) VALUES(1, 2, 2018);
INSERT INTO user_movie (movie_id, user_id, purchase_date) VALUES(2, 3, 2019);
INSERT INTO user_movie (movie_id, user_id, purchase_date) VALUES(9, 4, 2020);
INSERT INTO user_movie (movie_id, user_id, purchase_date) VALUES(1, 9, 2020);
INSERT INTO user_movie (movie_id, user_id, purchase_date) VALUES(5, 11, 2020);
INSERT INTO user_movie (movie_id, user_id, purchase_date) VALUES(9, 7, 2020);



INSERT INTO user_subscription (user_id, sub_id) VALUES(6, 2);
INSERT INTO user_subscription (user_id, sub_id) VALUES(8, 3);
INSERT INTO user_subscription (user_id, sub_id) VALUES(9, 4);
INSERT INTO user_subscription (user_id, sub_id) VALUES(1, 2);



INSERT INTO season (s_name, movie_id) VALUES('one', 1);
INSERT INTO season (s_name, movie_id) VALUES('one', 2);
INSERT INTO season (s_name, movie_id) VALUES('two', 1);
INSERT INTO season (s_name, movie_id) VALUES('two', 2);
INSERT INTO season (s_name, movie_id) VALUES('sring', 3);
INSERT INTO season (s_name, movie_id) VALUES('spring',4);
INSERT INTO season (s_name, movie_id) VALUES('three', 5);
INSERT INTO season (s_name, movie_id) VALUES('sring', 7);
INSERT INTO season (s_name, movie_id) VALUES('spring',8);
INSERT INTO season (s_name, movie_id) VALUES('three', 9);



------delete-----alter----update------


delete from rating where movie_id=8 and user_id =6;

delete from user_subscription where user_id =6 and sub_id =2;


update movie 
set duration = 140
where movie.movie_id =1;



UPDATE payment 
SET pay_date = '2017-04-06',
 amount  = 90
WHERE
user_id= 1;


drop table trending_movies ;


alter table users rename column password to user_password;


alter table movie drop column movie_language;



ALTER TABLE genre 
RENAME COLUMN type TO genre_type;



----------------views---------------------------------


--creating view to list all movies 

create view ListMovie as
select*from movie;


--insert into the view
INSERT INTO ListMovie (title, country, duration, year_release, price)
VALUES('war', 'china', 160, 2016, 350);

---update view 
update listmovie 
set country ='India'
where title='war';

--delete from the view 
delete from ListMovie where title ='war';




--movie with actors and country

create view actor_with_films  as 
select actor.f_name as "NAME" , actor.country as "COUNTRY" ,movie.title as "MOVIE"from actor 
join actor_movie ON 
actor.actor_id =actor_movie.actor_id 
join movie on movie.movie_id =actor_movie.movie_id ;



-- a view to list all those users who has subscription

create view user_with_subscription as 
select users.f_name ,users.l_name , subscriptions.sub_id from users 
join user_subscription ON 
users.user_id =user_subscription.user_id 
join subscriptions on subscriptions.sub_id =user_subscription.sub_id ;



--list all movies with their genre 

create view movie_with_genre as(
select  movie.title as "TITLE" , genre.genre_type as "GENRE"
from movie
join movie_genre on movie.movie_id =movie_genre.movie_id 
join genre on movie_genre.genre_id =genre.genre_id 
);


--view 
---find the name and id of those users who bought the movie and rate it 

create view  bought_and_rate as
(select users.f_name , users.user_id 
from users
join rating on users.user_id =rating.user_id 
join movie on rating.movie_id =movie.movie_id 
intersect 
select users.f_name ,users.user_id
from users 
join user_movie on users.user_id=user_movie.user_id 
join movie on user_movie.movie_id =movie.movie_id )


drop view user_with_subscription ;














