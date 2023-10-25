Identify records which are discrepant in the alignment of `is_nr=1` and `none(response_raw[entryId].isResponded=true)`. Use detected pattern to suggest a possible cause.

<!-- ``` sql 
select id, test_question_id, response_raw, is_nr  
from test_attempt_question_responses taqr 
where test_question_id = 13023
limit 1000
``` -->