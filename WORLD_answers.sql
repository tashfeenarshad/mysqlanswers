use world;
-- task 1 Using COUNT, get the number of cities in the USA.
select * from city where countrycode = 'USA';

-- task 2 Find out the population and life expectancy for people in Argentina.
select * from country where name = 'argentina';

-- task 3 Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy
SELECT * FROM country;
SELECT NAME,lifeExpectancy FROM country ORDER BY lifeExpectancy DESC LIMIT 1 ;
-- task 4 Using JOIN ... ON, find the capital city of Spain.
SELECT city.name, country.name
FROM country
LEFT JOIN city
ON country.capital=city.ID
AND country.code=city.countryCode
WHERE country.code='ESP';

-- task 5 Using JOIN ... ON, list all the languages spoken in the Southeast Asia region
SELECT LANGUAGE,region
FROM countrylanguage
LEFT JOIN country
ON countrylanguage.CountryCode=country.code
WHERE country.region='Southeast Asia';
-- task 6 Using a single query, list 25 cities around the world that start with the letter F.
SELECT NAME FROM city WHERE NAME LIKE 'f%' ORDER BY NAME ASC LIMIT 25;

-- task 7 Using COUNT and JOIN ... ON, get the number of cities in China.
SELECT 
    city,country,
    COUNT(*) 
FROM city, country
where country='china' 
GROUP BY city, country;

-- task 8 Using IS NOT NULL, ORDER BY, and LIMIT, which country has the lowest population? Discard non-zero populations.
select Population from country 
order by Population DESC
limit 1 ;

-- task 9 Using aggregate functions, return the number of countries the database contains.
SELECT SUM (name) FROM country;

-- task 10 What are the top ten largest countries by area
select SurfaceArea from country 
order by SurfaceArea ASC
limit 10;

-- task 11 List the five largest cities by population in Japan.
SELECT countrycode from city 
where countrycode ='JPN'
order by population ASC
limit 5 ;

-- task 12 List the names and country codes of every country with Elizabeth II as its Head of State. You will need to fix the mistake first!
SET SQL_SAFE_UPDATES = 0;
update country 
set HeadofState='Elizabeth II'
where HeadofState= 'Elisabeth II';
 
SELECT Code,
 Name FROM country WHERE HeadOfState LIKE "Elizabeth II";

-- task 13 List the top ten countries with the smallest population-to-area ratio. Discard any countries with a ratio of 0.
SELECT Name, SurfaceArea, Population, (Population/SurfaceArea) AS "Ratio" FROM country WHERE Population/SurfaceArea != 0 ORDER BY Population/SurfaceArea;


-- task 14 List every unique world language.
SELECT distinct* FROM world.countrylanguage;

-- task 15 List the names and GNP of the world's top 10 richest countries.
select name, GNP from country
order by GNP ASC;

-- task 16 List the names of, and number of languages spoken by, the top ten most multilingual countries.


-- task 17 List every country where over 50% of its population can speak German.
select countrycode, language, percentage from countrylanguage
having percentage >50
AND language= 'German';


-- task 18 Which country has the worst life expectancy? Discard zero or null values.
select LifeExpectancy,name from country 
order by LifeExpectancy != 0 ASC;



-- task 19 List the top three most common government forms.
SELECT count(*) govermentform from country
order by govermentform ASC
limit 5 ;

-- task 20 How many countries have gained independence since records began?


