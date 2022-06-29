use movielens;
-- task 1 List the titles and release dates of movies released between 1983-1993 in reverse chronological order.
SELECT title, release_date FROM movies 
WHERE release_date BETWEEN '1983-01-01' AND '1993-01-01' 
Order By release_date desc ;

-- task 2 
SELECT movies.title, ratings.rating FROM movies
INNER JOIN ratings ON movies.id = ratings.id Order By rating Asc ;

-- task 3 list the unique records for Sci-Fi movies where male 24-year-old students have given 5-star ratings.

SELECT g.id genre_id, g.`name` genre_name, gm.id genre_movie_id, m.id movie_id,
m.title movie_title, m.release_date, r.id rating_id, r.rating, r.rated_at,
u.id user_id, u.age, u.gender, u.zip_code, o.id occupation_id FROM genres g
INNER JOIN genres_movies gm ON g.id = gm.genre_id
INNER JOIN movies m ON gm.movie_id = m.id
INNER JOIN ratings r ON m.id = r.movie_id
INNER JOIN users u ON r.user_id = u.id
INNER JOIN occupations o ON u.occupation_id = o.id
WHERE g.`name` = 'Sci-Fi' AND u.age = 24 AND u.gender = 'M' AND o.`name` = 'Student' AND r.rating = 5 ;

-- task 4 List the unique titles of each of the movies released on the most popular release day.
SELECT title, release_date FROM movies
 WHERE release_date=(SELECT release_date FROM movies GROUP BY release_date ORDER BY COUNT(release_date) 
 DESC limit 1);

-- task 5 Find the total number of movies in each genre; list the results in ascending numeric order.
SELECT g.`name`, COUNT(*) movie_count FROM genres_movies gm
INNER JOIN genres g ON gm.genre_id = g.id
GROUP BY g.`name`
ORDER BY movie_count ASC;




