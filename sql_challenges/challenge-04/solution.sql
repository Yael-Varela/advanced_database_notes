--José Yael Varela García A01645324
--Analytic Functions: Databases for Developers

--Try it 1! :
--We group and filter based on the figure shape using Partition by 'shape'.
select b.*,
       count(*) over (
         partition by shape
       ) bricks_per_shape,
       median ( weight ) over (
         partition by shape
       ) median_weight_per_shape
from   bricks b
order  by shape, weight, brick_id;

--Try it 2! :
--For this exercise we only needed to complete the order by command, and since we want to have a running average based on weight, we can simply use the brick ID to have a cumulative value
select b.brick_id, b.weight,
       round ( avg ( weight ) over (
         order by brick_id
       ), 2 ) running_average_weight
from   bricks b
order  by brick_id;

--Try it 3! :
--In this case, we only need to fill in the range to filter the results. And the FreeSQL exercise told us how far back or forward our range needed to be moved.
select b.*,
       min ( colour ) over (
         order by brick_id
         rows between 2 preceding and 1 preceding
       ) first_colour_two_prev,
       count (*) over (
         order by weight
         range between current row and 1 following
       ) count_values_this_and_next
from   bricks b
order  by weight;


--Try it 4! :
--We used partition by shape to filter the sum of weight based on the shape of the figures. But we did not wanted to create a partition for the running weight, so we only needed to use the command "order by" to have a cumulative value.
--After that with only a conditional Where command we can filter the data.
with totals as (
  select b.*,
         sum ( weight ) over (
           partition by shape
         ) weight_per_shape,
         sum ( weight ) over (
           order by brick_id
         ) running_weight_by_id
  from   bricks b
)
select * from totals
where weight_per_shape > 4 and running_weight_by_id >4
order  by brick_id


--DataLemur Exercise
WITH ranking AS (
  SELECT department_id, name, salary, DENSE_RANK() OVER (
    PARTITION BY department_id ORDER BY salary DESC) AS salaryRanking
  FROM employee
)

SELECT department.department_name, ranking.name, ranking.salary FROM ranking
JOIN department ON ranking.department_id = department.department_id
WHERE (ranking.salaryRanking <= 3) ORDER BY department_name ASC, Salary DESC, name ASC;