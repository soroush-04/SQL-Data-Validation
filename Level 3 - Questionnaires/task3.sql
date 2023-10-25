-- SQLite

select * 
from task3qq;

select sqr.*  /*+ MAX_EXECUTION_TIME(10000000) */
from task3sqr 
join task3qq
	on sqr.question_id  = qq.id 
limit 1000000;

-- check information of task3qq table
PRAGMA table_info(task3qq);

SELECT *
FROM task3qq;


-- check information of task3sqr table
PRAGMA table_info(task3sqr);

SELECT * 
FROM task3sqr


/*
	based on the comparison we can detect the common columns in tables:
	
	scope_group_id
	test_design_version_id
	lang
	response_id
	test_window_id

	so we can use each of these 5 variables as the key to join and connect tables
*/
SELECT name
FROM pragma_table_info('task3qq');

SELECT name
FROM pragma_table_info('task3sqr');


/*
	also by checking both tables we find that 
	'question_label' in task3sqr table
	and
	'label' in task3qq table
	contain the question number through the database
*/

-- select rows from task3qq where label is 'Question 15' or 'Question 17'
SELECT *
FROM task3qq
WHERE label IN ('Question 15', 'Question 17');

-- select rows from task3sqr where question_label is 'Question 15' or 'Question 17'
SELECT *
FROM task3sqr
WHERE question_label IN ('Question 15', 'Question 17');

-- no output from this query
-- let's check the unique question_label variables in task3sqr
SELECT DISTINCT question_label
FROM task3sqr;
-- it only contains 'Question 1' 

-- let's see if we are dealing with missing value problem for question_label in task3sqr
SELECT *
FROM task3sqr
WHERE question_label != 'Question 1';
-- no output
-- so all the question_label has 'Question 1' tag in task3sqr


-- check Question 15 and Question 17 from task3qq again:
SELECT *
FROM task3qq
WHERE label IN ('Question 15', 'Question 17');

-- we have unique response_id for each variable
-- response_id is also one of the common columns in both tables
SELECT DISTINCT response_id
FROM task3qq;

SELECT DISTINCT response_id
FROM task3sqr;

/*
	 common response_id in tables:
	i16961.e11.r0
	i16961.e11.r1
	i16961.e11.r2
	i16961.e11.r3
*/

-- -- check response_id of these ones in task3sqr
-- SELECT *
-- FROM task3sqr
-- WHERE response_id 
-- 	IN ('i16961.e11.r0', 'i16961.e11.r1', 'i16961.e11.r2', 'i16961.e11.r3');

SELECT *
FROM task3qq
WHERE label IN ('Question 15', 'Question 17');
/*
	check 'Question 15' and 'Question 17' again 
	there are duplicate values of these variables
	it seems like there two different 'test_design_version_id'
	that created the same questions so we have two copies of them in out database.
*/

/*
	this duplication can have various impact on our data quality. 
	we have multiple options to deal with this problem such as:
	remove duplication 
	data versioning
	here in this example we will remove the remove duplication. 
*/

SELECT DISTINCT test_design_version_id
FROM task3qq
WHERE label IN ('Question 15', 'Question 17');
-- 2 various test_design_version_id shows the main source of this issue


-- check duplications and see test_design_version_id = 1772 is the more complete version
SELECT *
FROM task3qq
WHERE (label IN ('Question 15', 'Question 17')) AND (test_design_version_id = 1772);

SELECT *
FROM task3qq
WHERE (label IN ('Question 15', 'Question 17')) AND (test_design_version_id != 1772);

-- remove duplcation and keep more complite test design
DELETE FROM task3qq
WHERE test_design_version_id = 1695;



------------------------ 
-- SELECT DISTINCT test_design_version_id
-- FROM task3qq;

-- SELECT DISTINCT test_design_version_id
-- FROM task3sqr;

-- SELECT *
-- FROM task3sqr;


-- /*
-- 	unique id in task3qq while label in ... 
-- 	18712
-- 	18715
-- 	18759
-- 	18761
-- */
-- SELECT DISTINCT id
-- FROM task3qq
-- WHERE label IN ('Question 15', 'Question 17');

