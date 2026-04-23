--Jose Yael Varela Garcia

--exercise 1
-- Questions:

--a) What scan type do you see? Why?
It's a full table scan since there is no index and therefore it scans the full table.

-- b) site_id has values 1–5. Is this high or low cardinality?
It's low

-- c) Would adding an index on site_id help? Why or why not?
No, because there is a lot of rows that has the same value.


--exercise 2
-- Index created
CREATE INDEX idx_pv_visit_date ON patient_visits(visit_date);

-- Questions:
-- a) Does Oracle use the index for this range?
It depends on the range. Oracle uses the index for smaller ranges (7 days) but may perform a full table scan for larger ranges (such as the 30 or 700 days).
-- b) Change the range to the last 7 days. Does the plan change?
Yes, Oracle uses an Index range scan because fewer rows are returned, being more efficient than a full table scan.
-- c) Change to the last 700 days. What happens?
Oracle performs a full table scan because most of the table is accessed.
-- d) Why does the range size affect whether Oracle uses the index?
Because the optimizer chooses the most efficient access path for retrieving data based on cost. 

--exercise 3
-- Questions:
-- a) Does the plan use the composite index?
    Yes, it does.
-- b) Now try querying ONLY on visit_date (no patient_id).
--    Does the composite index get used? Why not?
    No, it does not, since we are ignoring the patient_id and therefore it won't look using the index.
-- c) What's the rule about column order in composite indexes?
    The rule is that we must use the leading column of the index.

--exercise 4
-- Questions:
-- a) What scan type did the second query use?
    A full table scan.
-- b) Why does wrapping a column in a function break index use?
    Because the patient_id column is changed in the line TO_CHAR(patient_id)
-- c) How would you rewrite the second query to allow index use?
    Rewriting the query without a function (if is needed apply the function to the value, but not the column).

--exercise 5

-- Scenario A
-- a) Would you add an index?
    Yes.
-- b) On which column(s)?
    In the date column.
-- c) Any concerns?
    No, because the index improves queries by range, it will use more space, but the benefits heavily outperform the downsides.

-- Scenario B
-- a) Would you add an index?
    Yes.
-- b) On which column(s)?
    In the customer_id. A composite index could be used, but it depends if we consider the problem as low-cardinality, because it will not be very 
    effective. 
-- c) Any concerns?
    Since there is a lot of indexes, the insert operations becomes slower.
    
-- Scenario C
-- a) Would you add an index?
    Yes.
-- b) On which column(s)?
    On the email column. Using a unique index.
-- c) Any concerns?
    No, it has a high cardinality and it has exact searches.