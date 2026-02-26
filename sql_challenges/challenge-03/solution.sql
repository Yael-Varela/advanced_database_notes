--José Yael Varela García - A01645324

--SQL Bolt Lessons
--Lesson 10

--Since the exercise ask for the longest time an employee has been working in the company we can just apply max to the years_exployed column to find the info.
SELECT max(years_employed) FROM employees;

--With group by I can obtain the different years worked for each role, if it were not applied, it would generate an error and the necessary data for each role would not be obtained.
SELECT role, AVG(years_employed) FROM employees GROUP BY role;

--Same logic than the previous exercise.
SELECT building, SUM(years_employed) FROM employees GROUP BY building;


--Lesson 11
--First we could count the rows in the role column, but that would give the total number of rows, so we need a WHERE conditional and the use of LIKE (or =) to filter by "Artist"
SELECT COUNT(role) FROM employees WHERE role LIKE ("Artist");

--Following a similar logic to the exercises in the previous lesson, we can use Group By to show me the result for each role.
SELECT role, COUNT(role) FROM employees GROUP BY role;

--And finally for the last exercise is the same logic than the first exercise of the lesson, we can use = or LIKE to filter the roles so that we can obtain the total sum of the years employed of only the engineers.
SELECT role, sum(years_employed) FROM employees WHERE role = "Engineer";



--FreeSQL -Aggregation- Try it!
--Exercise 1
--Using distinct within a SQL aggregation allows us to calculate results based only on unique values, ignoring duplicates.
select count(distinct shape) AS number_of_shapes,
       stddev(distinct weight) AS distinct_weight_stddev
from   bricks;

--Exercise 2
--We sum the total weight of each distinct shape (using group by)
SELECT shape, SUM(weight) AS shape_weight FROM  bricks
GROUP BY shape;

--Exercise 3
--With HAVING SUM we can filter the shapes that has a total weight of less than 4.
SELECT shape, SUM ( weight ) FROM bricks
HAVING SUM(weight)<4
GROUP BY shape;