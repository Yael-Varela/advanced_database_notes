# Concept name
Vector search

## My understanding
It's the way to find results by concept rather than by keywords. 


## Why it matters
Because we can filter and find data that does not have keywords, like images or audio which is not structurized text.


## Example
SELECT
    chunk_id,
    SUBSTR(chunk_text, 1, 100) AS preview,
    ROUND(VECTOR_DISTANCE(chunk_vector, TO_VECTOR(TO_CLOB('[-0.05899293, -0.05536010, -0.03787170, 0.06091257, -0.05435111, 0.01216397, 0.00658386) AS similarity_score
FROM doc_chunks
ORDER BY similarity_score ASC
FETCH FIRST 3 ROWS ONLY;