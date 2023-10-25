-- SQLite

SELECT question_id FROM task1;

SELECT taqr_id FROM task1;

select sqr.taqr_id, sqr.response, sqr.score
from task1 sqr 
where sqr.question_id = 17404


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

SELECT *
FROM task1
WHERE question_id = 12563;

-- question 12563

SELECT *
FROM task1
WHERE question_id = 12563
  AND response = 'A'
  AND score <> 1;
-- scores are accurate. all 'A' responses got 1 score.

SELECT *
FROM task1
WHERE question_id = 12563
  AND response <> 'A'
  AND score <> 0;
-- scores are accurate. all the not 'A' responses got 0 score.


-- question 12595
SELECT *
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

-- check correct responses that didn't get full score '2'
SELECT *
FROM task1
WHERE question_id = 12595
  AND response = 'borrow=>[Receiving money with an agreement to repay it in the future, usually with interest charged.], lend=>[Giving money to a person or a business with the expectation that it will be repaid.], trade=>[The transfer of goods and services, often in exchange for money from one individual or organization to another.]'
  AND score < 2;








SELECT *
FROM task1
WHERE question_id = 17404;

SELECT *
FROM task1
WHERE question_id = 17495;

-- taqr_id check: 
-- there is no duplicate taqr_id in the table
SELECT taqr_id, COUNT(taqr_id) AS count
FROM task1
GROUP BY taqr_id
HAVING count > 1;




