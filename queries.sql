
---group 5 
--samima hassan
--defne sahal
--zeynep dilay toptas 



-------special queries----------------

select genre.genre_type as Category, COUNT(*) as viewss
from movie
join user_movie 
	on movie.movie_id = user_movie.movie_id 
JOIN movie_genre
	on  movie.movie_id = movie_genre.movie_id
JOIN genre 
	on genre.genre_id = movie_genre.genre_id 
where movie.year_release = 2016 and user_movie.purchase_date = 2020
GROUP by Category
Order by views Desc
Limit 3;




select users.f_name as User_Name, sum(movie.price) as total, subscriptions.sub_type as "SUB"
from users 
JOIN user_movie 
	on users.user_id = user_movie.user_id
JOIN movie 
	on movie.movie_id = user_movie.movie_id
JOIN movie_genre
	on movie.movie_id = movie_genre.movie_id
JOIN genre
	on movie_genre.genre_id = genre.genre_id 
JOIN user_subscription
	on users.user_id = user_subscription.user_id
JOIN subscriptions
	on subscriptions.sub_id = user_subscription.sub_id 
where genre.genre_type like '%fiction%'
GROUP by user_movie.user_id , users.f_name , subscriptions.sub_type 
having sum(movie.price) > 300 and subscriptions.sub_type <> 'monthly';



-----------other quries------------


--set operations queries 
--union
--shows the name of actors from usa and turkey

select actor.f_name as "NAME" , actor.country as "COUNTRY"
from actor where actor.country ='turkey'
union 
select actor.f_name as "NAME", actor.country as "COUNTRY" 
from actor where actor.country='south korea';



--those movie which was realised in turkey and in year 2016

select movie.title  as "TITLE" , movie.year_release as "R YEAR " from movie where 
movie.year_release =2016
intersect 
select movie.title  as "TITLE" , movie.year_release as "R YEAR " from movie where 
movie.country ='turkey';


--intersect
---find the name and id of those users who bought the movie and rate it 

select users.f_name , users.user_id
from users
join rating on users.user_id =rating.user_id 
join movie on rating.movie_id =movie.movie_id 
intersect 
select users.f_name ,users.user_id
from users 
join user_movie on users.user_id=user_movie.user_id 
join movie on user_movie.movie_id =movie.movie_id ;


--except 
--name of the users who rate a movie in 2017 but not in 2016

select users.f_name , users.user_id
from users
join rating on users.user_id =rating.user_id 
join movie on rating.movie_id =movie.movie_id 
where rating.rate_year =2017
except 
select users.f_name , users.user_id
from users
join rating on users.user_id =rating.user_id 
join movie on rating.movie_id =movie.movie_id 
where rating.rate_year =2016 ;



--outer join left
--list all users show their rating if they have rate 

SELECT users.f_name ,rating.rate_star , rating.rate_year 
FROM users
LEFT JOIN rating 
ON users.user_id =rating.user_id ;





--finding the average price of movies
select avg(price) as"AVERAGE PRICE" from movie;


--name of user and sum of amount spent on app 
SELECT users.user_id ,users.f_name ,SUM(payment.amount ) as "SPENT"
  FROM payment
  join users on payment.user_id =users.user_id 
 WHERE  users.user_id =payment.user_id 
 group by users.f_name ,users.user_id ;



--count
--groupby
--counting all the movie per genre
select genre.genre_type ,count(*) as "number of movie"
from genre
join movie_genre on genre.genre_id =movie_genre.genre_id 
join movie on movie.movie_id =movie_genre.movie_id 
group by genre.genre_id;



--ordery by asc
--list all those users who have subscription by ascending order 
select subscriptions.sub_id as "ID" , users.f_name as "NAME"
from subscriptions
join user_subscription on subscriptions.sub_id =user_subscription.sub_id 
join users on user_subscription.user_id =users.user_id order by subscriptions.sub_id asc ;



--name of users from differet country
select distinct country,f_name from users 
order by country,f_name asc ;



--list all movies with their genre 
select distinct movie.title as "TITLE" , genre.genre_type as "GENRE"
from movie
join movie_genre on movie.movie_id =movie_genre.movie_id 
join genre on movie_genre.genre_id =genre.genre_id ;



--print the name of user and the movie they didnt rate 
select users.f_name , movie.title from users 
join rating on users.user_id =rating.user_id 
join movie on rating.movie_id =movie.movie_id 
where rating.rate_star is null
;



--between/ and 
--list all the movies which has been rated beetween 2017 ad 2016
select users.f_name , movie.title, rate_year from users 
join rating on users.user_id =rating.user_id 
join movie on rating.movie_id =movie.movie_id 
where rating.rate_year between 2016 and 2017;



--print the name of actor who has ar in their first name 
select actor.f_name , actor.gender from actor where 
actor.f_name like '%ar%';





---subqueries 
--returning all those uers who have rated a movie and from turkey 

select  f_name , rating.rate_year , rating.rate_star 
from users join rating on rating.user_id =users.user_id 
where rating.user_id in (
select users.user_id from users
where country ='turkey'
);



--return name of the movie which has more price then "decent"  movie 
select movie.title, price from movie
where movie.price >
 (select (price) from movie
where movie.title ='decent'
);



-- the average duration of genres  
-- the inner subquery give the table of average spend on each genre 
--the outer query then calculate the average duration of all genre 

select avg(average_t )
from(
select genre.genre_type ,avg(movie.duration ) as average_t
from movie
join movie_genre ON movie.movie_id =movie_genre.genre_id 
join genre ON movie_genre.genre_id =genre.genre_id 
group by genre_type 
) as temp1


-----view queries------------

select*from movie_with_genre;
select*from bought_and_rate;
select*from listmovie;
select*from user_with_subscription ;
select*from actor_with_films ;







