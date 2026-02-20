# Concept name
SQL JOIN

## My understanding
It's an SQL command that allows us to combine two or more tables.There are multiple types of JOIN, but the basic JOIN command (also called INNER JOIN) returns only the rows that exist in both tables.


## Why it matters
JOIN matters because databases are usually normalized to avoid redundancy. Without normalizing databases, it would be a mess to get, load and modify information within the database. By normalizing the database, it's more efficient, but as a trade off, we have got more tables. Having more tables would create a need to combine the information that they contain, so we need something to combine them in a particular way. That's where JOIN is applied.


## Example
SELECT Title, Domestic_sales, International_sales FROM movies
INNER JOIN Boxoffice ON Movies.id = Boxoffice.movie_id;

