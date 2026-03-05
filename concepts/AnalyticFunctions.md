# Concept name
Analytic Functions

## My understanding
Analytical functions (or Window functions) are functions that calculate the accumulation of a certain value based on a certain group of rows.

## Why it matters
Because they can perform complex calculations and provide more detail, since they allow us to see the values from all the other columns, unlike the GROUP BY.

## Example
select b.*,
       count(*) over (
         partition by shape
       ) bricks_per_shape,
       median ( weight ) over (
         partition by shape
       ) median_weight_per_shape
from   bricks b
order  by shape, weight, brick_id;
