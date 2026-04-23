# Concept name
Indexes

## My understanding
They are data structures that help in retrieving data. It allows to locate specific rows in a faster way (in certain situtations) than scanning the full table.

Composite index: It's an index thats created upon two or more rows of the same table.

Partial index: It's created upon a subset of data in a table (like creating a index for all the Oracle task that are 'In_progress')

## Why it matters
Since we can quickly retrieve and find specific data, as the size of the database increases, it becomes increasingly convenient to use indexes.

## Example
-- Index created
CREATE INDEX idx_pv_visit_date ON patient_visits(visit_date);
