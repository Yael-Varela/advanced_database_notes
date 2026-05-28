# Concept name
Aggregations.

## My understanding
These are SQL functions that act as calculation tools for the entire column, there are multiple types of SQL Aggregation functions such as:

SUM: Calculates the total sum of a numerical column.
COUNT: Counts the number of rows in a group, or the number of non null rows if a specific column is selected
AVG: Calculates the average value of a numerical column.
MAX and MIN: Find the highest and lowest values in a column.
 
## Why it matters
It is impactful because by being able to perform mathematical calculations in a column that has numerical values, manual calculation work can be saved, making the calculations more efficient.

## Example
This is an example using "MAX"
SELECT max(years_employed) FROM employees;