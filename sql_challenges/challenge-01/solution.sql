--lesson 1
SELECT title FROM movies;
SELECT director FROM movies;
SELECT director, title FROM movies;
SELECT year, title FROM movies;
SELECT * FROM movies;

--lesson 2
SELECT * FROM movies WHERE id=6;
SELECT * FROM movies WHERE year>=2000 AND year<=2010;
SELECT * FROM movies WHERE NOT (year>=2000 AND year<=2010);
SELECT title, year FROM Movies ORDER BY id limit 5

--lesson 3
SELECT * FROM movies WHERE Title LIKE "%Toy Story%";
SELECT * FROM movies WHERE Director IN ("John Lasseter")
SELECT * FROM movies WHERE Director NOT IN ("John Lasseter")
SELECT * FROM movies WHERE Title LIKE ("%wALL-%")

--lesson 4
SELECT DISTINCT director FROM Movies ORDER BY director ASC;
SELECT * FROM Movies ORDER BY Year DESC Limit 4;
SELECT * FROM Movies ORDER BY Title ASC Limit 5;
SELECT * FROM Movies ORDER BY Title ASC Limit 5 OFFSET 5;

--lesson 5
SELECT City, Population FROM north_american_cities Where Country LIKE ("Canada");
SELECT * FROM north_american_cities WHERE Country LIKE ("United States") ORDER BY Latitude DESC;
SELECT * FROM north_american_cities WHERE Longitude<(SELECT Longitude FROM north_american_cities WHERE City LIKE ("Chicago")) ORDER BY Longitude ASC;
SELECT * From north_american_cities WHERE Country LIKE ("Mexico") ORDER BY Population DESC Limit 2; 
SELECT * From north_american_cities WHERE Country LIKE ("United States") ORDER BY Population DESC Limit 2 OFFSET 2; 