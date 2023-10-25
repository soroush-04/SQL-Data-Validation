-- SQLite

SELECT test_question_id FROM task2;

-- learning more about the dataset
PRAGMA table_info(task2);

SELECT name
FROM pragma_table_info('task2');

SELECT *
FROM task2;

-- we only have one test_question_id: 13023
SELECT DISTINCT test_question_id
FROM task2;

-- two types of is_nr: 0, 1
SELECT DISTINCT is_nr
FROM task2;

-- 16 various types of response_raw
SELECT DISTINCT response_raw
FROM task2;

-- each row has unique id
SELECT DISTINCT id
FROM task2;

-- SELECT id, test_question_id, response_raw, is_nr
-- FROM task2
-- WHERE test_question_id = 13023
-- AND is_nr = 1
-- AND (
--   NOT EXISTS (
--     SELECT 1
--     FROM json_each(response_raw)
--     WHERE json_extract(value, '$.isResponded') = 'true'
--   )
-- )
-- LIMIT 1000;


-- find the rows with required situation for isResponded and is_nr
SELECT *
FROM task2
WHERE is_nr = 1
AND NOT EXISTS (SELECT 1
                FROM json_each(response_raw)
                WHERE json_extract(value, '$.isResponded') = 'true')
LIMIT 1000;

/*
    as we can see in the output of above query, 
    there are 20 rows with the required scenario we were looking for.
*/


/*
    HIDDEN PATTERN:
    all of these 20 rows that we extracted from the above query,
    has exactly the same "response_raw" json file. 
    so this is the specific pattern that makes  
    `is_nr=1` and `none(response_raw[entryId].isResponded=true)`
*/
SELECT DISTINCT response_raw
FROM task2
WHERE is_nr = 1
AND NOT EXISTS (
    SELECT 1
    FROM json_each(response_raw)
    WHERE json_extract(value, '$.isResponded') = 'true'
);
