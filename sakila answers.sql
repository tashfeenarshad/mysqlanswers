use sakila ;
-- task 1 List all actors.
select * from actor ;
-- task 2 Find the surname of the actor with the forename 'John'.
select * from actor where first_name = 'john';

-- task 3 Find all actors with surname 'Neeson'.
select * from actor where last_name = 'Neeson';

-- task 4 Find all actors with ID numbers divisible by 10.
SELECT * FROM actor WHERE (actor_id % 10) = 0;

-- task 5 What is the description of the movie with an ID of 100
SELECT * FROM film WHERE film_id = 100;

-- task 6 Find every R-rated movie.
SELECT * FROM film WHERE Rating = 'R';
-- task 7 Find every non-R-rated movie.

SELECT * FROM film WHERE Rating = ! 'R';
-- task 8 Find the ten shortest movies.

SELECT MIN(length) FROM film;
-- task 9 longest movie
SELECT title FROM film WHERE length In ( SELECT MAX(length) FROM film);

-- task 10 Find all movies that have deleted scenes.
SELECT title FROM film WHERE special_features ='deleted scenes' ;

-- task 11 Using HAVING, reverse-alphabetically list the last names that are not repeated.
SELECT last_name `Last Name` FROM actor GROUP BY last_name HAVING count(*)=1 ORDER BY last_name DESC;

 
 -- task 12 Using HAVING, list the last names that appear more than once, from highest to lowest frequency.
SELECT last_name, count(*) FROM actor GROUP BY last_name HAVING count(*)>=2 ORDER BY count(*) DESC;

-- task 13 Which actor has appeared in the most films
SELECT actor_id, COUNT(*) film_count FROM film_actor
GROUP BY actor_id
HAVING film_count > 1
ORDER BY COUNT(actor_id) DESC
limit 1 ;

-- task 14 When is ‘Academy Dinosaur’ due?
select rental_duration from film where film_id = 1;
select rental_id from rental order by rental_id desc limit 1;
select rental_date,
       rental_date + interval
                   (select rental_duration from film where film_id = 1) day
                   as due_date
from rental
where rental_id = (select rental_id from rental order by rental_id desc limit 1);

-- task 15 What is the average runtime of all films?
select avg(length) from film;

-- task 16 List the average runtime for every film category.
SELECT fc.category_id, AVG(length) FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
GROUP BY fc.category_id;

-- task 17 List all movies featuring a robot.
select * from film_text where `description` = 'robot';

-- task 18 How many movies were released in 2010?
select * from film where release_year= 2010;

-- task 19 Find the titles of all the horror movies
select category.name, avg(length)
from film join film_category using (film_id) join category using (category_id)
group by category.name
order by avg(length) desc;

-- task 20 List the full name of the staff member with the ID of 2.
SELECT * FROM staff WHERE (staff_id) = 2;

-- task 21 List all the movies that Fred Costner has appeared in.
select * from actor where first_name = 'fred';


-- task 22  How many distinct countries are there
select count(distinct country) from country ;


-- task 23 List the name of every language in reverse-alphabetical order.
SELECT * FROM `language` order by `name` DESC ;

-- task 24 List the full names of every actor whose surname ends with '-son' in alphabetical order by their forename.
SELECT * FROM actor WHERE last_name LIKE '%son' order by last_name ASC;


-- task 25 Which category contains the most films?







								 






