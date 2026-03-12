-- José Yael Varela García A01645324
-- Union, Minus, and Intersect: Databases for Developers

-- Try it 1!
select colour from my_brick_collection
union --to combine the rows of the two select into one set but filtering out the duplicates.
select colour from your_brick_collection
order by colour;


select shape from my_brick_collection
union all -- to combine but also leave the duplicates (all the results)
select shape from your_brick_collection
order  by shape;


-- Try it 2!
select shape from my_brick_collection
minus -- (rows in set 1 that are not in set 2)
select shape from your_brick_collection;


select colour from my_brick_collection
intersect -- (rows that are in both selects)
select colour from your_brick_collection
order  by colour;
