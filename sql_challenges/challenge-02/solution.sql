-- Lesson 6
--My logic for this exercise was, first, to declare the columns containing the necessary information, such as the title and domestic and international sales. Then, I had to JOIN the two tables to combine them using the movie ids, which acted as the key to join them.
SELECT Title, Domestic_sales, International_sales FROM movies
INNER JOIN Boxoffice ON Movies.id = Boxoffice.movie_id;

--This exercise follows the same logic as the previous one, but only adding a conditional that guarantees that we only obtain a table where international sales are greater than local sales.
SELECT Title, Domestic_sales, International_sales FROM movies
INNER JOIN Boxoffice ON Movies.id = Boxoffice.movie_id
WHERE International_sales > Domestic_sales;


--The logic behind this was to join both tables using the movie IDs, combining them into a single table. With that, we have all the movie titles and their ratings, which were then sorted by DESC rating using ORDER BY.
SELECT Title, Rating FROM movies
INNER JOIN Boxoffice ON Movies.id = Boxoffice.movie_id
ORDER BY Rating DESC;


--Lesson 7
--The logic was that we only cared about the data in the employees table, since it is the only table that tells us which buildings have employees, but we needed to use DISTINCT to avoid duplicates of the same building.
SELECT DISTINCT Building FROM employees;

--Since the exercise only asks for the name and capacity of the building, it corresponds to all the information contained only in the "Buildings" table, so we only need to select all the data within the table.
SELECT * FROM Buildings;


--It was very important to write Role before Building_name so that the DISTINCT command could mean that we wanted the Roles without duplication, not the buildings.
SELECT DISTINCT Role, Building_name FROM Buildings LEFT JOIN Employees 
ON Buildings.building_name = Employees.building;


--Interview Question
--By combining the "pages" table with "page_likes" using LEFT JOIN, we can ensure that all pages are included in the results table, regardless of whether they have likes or not, that's why by using a WHERE conditional, we can guarantee that only the results for pages without likes (are null) are displayed and ordered.
SELECT pages.page_id FROM pages LEFT JOIN page_likes ON pages.page_id = page_likes.page_id
WHERE (page_likes.page_id  IS NULL) ORDER BY page_id ASC;