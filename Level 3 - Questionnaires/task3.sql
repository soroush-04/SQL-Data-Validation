-- SQLite

select * 
from task3qq;

select sqr.*  /*+ MAX_EXECUTION_TIME(10000000) */
from task3sqr 
join task3qq
	on sqr.question_id  = qq.id 
limit 1000000;

PRAGMA table_info(task3qq);
