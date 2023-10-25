-- SQLite

SELECT question_id FROM task1;

SELECT taqr_id FROM task1;

select sqr.taqr_id, sqr.response, sqr.score
from task1 sqr 
where sqr.question_id = 17404

-- table info and data types
PRAGMA table_info(task1);


-- identify unique question_id in the 'task1' table
/* 
    by running this query, we detect 4 different questions in out dataset:
    12563
    12595
    17404
    17495
*/
SELECT DISTINCT question_id
FROM task1;

-- investigate each question response/score seperately


-----------------------------------------
-- question 12563
SELECT *
FROM task1
WHERE question_id = 12563;

SELECT *
FROM task1
WHERE question_id = 12563
  AND response = 'A'
  AND score != 1.0;
-- there is only 1 inaccurate row for this situation.

-- Update the inaccurate row
UPDATE task1
SET score = 1.0
WHERE question_id = 12563
  AND response = 'A'
  AND score != 1.0;


SELECT *
FROM task1
WHERE question_id = 12563
  AND response != 'A'
  AND score = 1.0;
-- there are some errors in this scenarios

-- taqr_id = 27171090 has response "A;A" which needs to be "A"
UPDATE task1
SET response = 'A'
WHERE taqr_id = 27171090;

-- correct rows which not 'A' response but got 1.0 score
UPDATE task1
SET score = 0.0
WHERE question_id = 12563
  AND response != 'A'
  AND score = 1.0;

-- check unique scores 
-- we get 0.0, 1.0, 2.0, -1.0
SELECT DISTINCT score
from task1
WHERE question_id = 12563 ;

-- check score 2.0
SELECT * 
FROM task1 
WHERE question_id = 12563 
  AND score = 2.0;

-- update score 2.0 variables to score 0.0
UPDATE task1
SET score = 0.0
WHERE question_id = 12563
  AND score = 2.0;

-- double check
SELECT DISTINCT score
FROM task1
WHERE question_id = 12563;

-- we solved score 2.0 issue
-- now let's solve score -1.0 issue

SELECT *
FROM task1
WHERE question_id = 12563
  AND score = -1.0;

-- update score -1.0 variables to score 0.0
UPDATE task1
SET score = 0.0
WHERE question_id = 12563
  AND score = -1.0;

-- now it's all fixed for question_id = 12563


-----------------------------------------
-- question 12595
SELECT *
FROM task1
WHERE question_id = 12595;

-- check unique score in question_id=12595
SELECT DISTINCT score
FROM task1
WHERE question_id = 12595;

/*
    correct answer is (English version):
    "
    borrow=>[Receiving money with an agreement to repay it in the future, usually with interest charged.], 
    lend=>[Giving money to a person or a business with the expectation that it will be repaid.], 
    trade=>[The transfer of goods and services, often in exchange for money from one individual or organization to another.]
    "
    
    (French version):
    "
    echanges=>[Transférer des biens et des services, souvent en échange d'argent, d'un individu à un autre ou d'une organisation à une autre.], 
    emprunt=>[Recevoir de l'argent en ayant pour accord de le rembourser plus tard, généralement avec des intérêts.], 
    pret=>[Donner de l'argent à une personne ou à une entreprise en s'attendant à ce qu'il soit remboursé.]	
    "

    full score is 2
*/

-- check correct responses that didn't get full score '2' (English version)
SELECT *
FROM task1
WHERE question_id = 12595
  AND response = 'borrow=>[Receiving money with an agreement to repay it in the future, usually with interest charged.], lend=>[Giving money to a person or a business with the expectation that it will be repaid.], trade=>[The transfer of goods and services, often in exchange for money from one individual or organization to another.]'
  AND score != 2.0;


-- update rows with correct response but not 2 score (eng version)
UPDATE task1
SET score = 2.0
WHERE question_id = 12595
  AND response = 'borrow=>[Receiving money with an agreement to repay it in the future, usually with interest charged.], lend=>[Giving money to a person or a business with the expectation that it will be repaid.], trade=>[The transfer of goods and services, often in exchange for money from one individual or organization to another.]'
  AND score != 2.0;


-- check correct responses that didn't get full score '2' (French version)
SELECT *
FROM task1
WHERE question_id = 12595
  AND response = 'echanges=>[Transférer des biens et des services, souvent en échange d''argent, d''un individu à un autre ou d''une organisation à une autre.], emprunt=>[Recevoir de l''argent en ayant pour accord de le rembourser plus tard, généralement avec des intérêts.], pret=>[Donner de l''argent à une personne ou à une entreprise en s''attendant à ce qu''il soit remboursé.]'
  AND score != 2.0;

-- update rows with correct response but not 2 score (fr version)
UPDATE task1
SET score = 2.0
WHERE question_id = 12595
  AND response = 'echanges=>[Transférer des biens et des services, souvent en échange d''argent, d''un individu à un autre ou d''une organisation à une autre.], emprunt=>[Recevoir de l''argent en ayant pour accord de le rembourser plus tard, généralement avec des intérêts.], pret=>[Donner de l''argent à une personne ou à une entreprise en s''attendant à ce qu''il soit remboursé.]'
  AND score != 2.0;


-- no error in this case
SELECT *
FROM task1
WHERE question_id = 12595
  AND response NOT IN (
    'borrow=>[Receiving money with an agreement to repay it in the future, usually with interest charged.], lend=>[Giving money to a person or a business with the expectation that it will be repaid.], trade=>[The transfer of goods and services, often in exchange for money from one individual or organization to another.]',
    'echanges=>[Transférer des biens et des services, souvent en échange d''argent, d''un individu à un autre ou d''une organisation à une autre.], emprunt=>[Recevoir de l''argent en ayant pour accord de le rembourser plus tard, généralement avec des intérêts.], pret=>[Donner de l''argent à une personne ou à une entreprise en s''attendant à ce qu''il soit remboursé.]'
  )
  AND score = 2.0;


-- SELECT *
-- FROM task1
-- WHERE question_id = 12595
--   AND (
--     (response NOT LIKE '%borrow=>[Receiving%'
--     OR response NOT LIKE '%lend=>[Giving%'
--     OR response NOT LIKE '%trade=>[The transfer%')
--     AND score != 2
--   );

-- no errors 
SELECT *
FROM task1
WHERE question_id = 12595
AND score = 1.33333;

-- no errors here. 
-- two descriptions are exchanged here which makes the score correct 0.666667
SELECT *
FROM task1
WHERE question_id = 12595
AND score = 0.666667;

-- now it's all fixed for question_id = 12595

-----------------------------------------
-- question 17404
SELECT *
FROM task1
WHERE question_id = 17404 
  AND score=2.0
  AND response = '1=>(EMPTY), 1=>2, 2=>(EMPTY), 2=>5, 3=>3, 3=>1, 4=>4, 5=>(EMPTY), 6=>6';
-- correct response with 2.0 score is: 
-- 1=>(EMPTY), 1=>2, 2=>(EMPTY), 2=>5, 3=>3, 3=>1, 4=>4, 5=>(EMPTY), 6=>6	

-- let's detect error
SELECT t1.*
FROM task1 t1
WHERE t1.question_id = 17404 
  AND t1.score = 2.0
  AND t1.response = '1=>(EMPTY), 1=>2, 2=>(EMPTY), 2=>5, 3=>3, 3=>1, 4=>4, 5=>(EMPTY), 6=>6'
  AND (
    SELECT COUNT(*)
    FROM task1 t2
    WHERE t2.question_id = 17404
      AND t2.response = '1=>(EMPTY), 1=>2, 2=>(EMPTY), 2=>5, 3=>3, 3=>1, 4=>4, 5=>(EMPTY), 6=>6'
      AND t2.score = 2.0
  ) = 0;

-- check if response is correct but score is not 2.0
SELECT *
FROM task1
WHERE question_id = 17404 
  AND response != '1=>(EMPTY), 1=>2, 2=>(EMPTY), 2=>5, 3=>3, 3=>1, 4=>4, 5=>(EMPTY), 6=>6'
  AND score = 2.0;
  -- no error

/*
  we get these uni
*/
SELECT DISTINCT score
from task1
WHERE question_id = 12563 ;





SELECT DISTINCT score
FROM task1
WHERE question_id = 17404;


-----------------------------------------
-- question 17495
SELECT *
FROM task1
WHERE question_id = 17495;

SELECT DISTINCT score
FROM task1
WHERE question_id = 17495;

SELECT *
FROM task1
WHERE question_id = 17495
AND score = 2.0;

SELECT *
FROM task1
WHERE question_id = 17495
AND score = 0.0;

SELECT *
FROM task1
WHERE question_id = 17495
  AND response != '1=>1, 1=>5, 2=>2, 2=>1, 3=>3, 3=>1, 4=>4, 4=>6, 5=>5, 6=>6'
  AND score = 0.0;

