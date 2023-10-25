Identify anomalies between Questions 15 and Question 17.

``` sql
select * 
from 20220813_tw_40.QuestionnaireQuestions qq
;

select sqr.*  /*+ MAX_EXECUTION_TIME(10000000) */
from 20220813_tw_40.SubmittedQuestionResponses sqr 
join 20220813_tw_40.QuestionnaireQuestions qq
	on sqr.question_id  = qq.id 
limit 1000000
; 
```