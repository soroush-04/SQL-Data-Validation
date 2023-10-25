# Data Validation Sample - SQL
---

This folder contains 3 data spot checks, each in progressively increasing difficulty. Each folder contains its own readme and the data extracts which are the subject of the validation (and files which might be useful for reproducing the source data).

<u>Table of contents</u>
=======

<!--ts-->
  - [Level 1 - Score Alignment](#level1)
  - [Level 2 - NR Check](#level2)
  - [Level 3 - Questionnaires](#level3)
<!--te-->

---

#### All the sql files contain step by step commenting for clear understanding of each specific approach.

##  Level 1 - Score Alignment  <a id="level1"></a>

In this task we deal with inaccurate variables correlated to score and response columns. 
I used SQL queries to analyze the database and then adjusted the scores to their appropriate and expected value. The main approach that I used for this task was to separate the database by `question_id` and then evaluate them one by one; Since each question has it's own specific response type and it makes error handling easier and more concise.
<br>


##  Level 2 - NR Check  <a id="level2"></a>

I used SQL queries for database analysis and then identified records which are discrepant in the alignment of `is_nr=1` and `none(response_raw[entryId].isResponded=true)`. The main pattern between all of these rows were about the exact same json queries in response column which was the reason caused this issue.
<br>


##  Level 3 - Questionnaires  <a id="level3"></a>

After data analysis, there is one specific evidence that shows an inaccurate data for `Question 15` and `Question 17`. The main issue in the table was related to two various `test_design_version_id` variable that created duplicated output to the database. In this scenario we can deal with this duplication issue in multiple approaches such as:
- Data Deduplication: removing the duplicate entries and retaining only one of each. This will eliminate redundancy and keep our data cleaner.
- Data Versioning: If retaining both versions is important, we can consider creating a versioning system. We would add a field to indicate the version of each question, allowing us to distinguish between them.

In this approach, I utilized data deduplication technique and keep `test_design_version_id = 1772` which was more complete version regarding to the other duplication `test_design_version_id = 1695`. 
Also, this duplcation issue can cause serious problem for the future usage in our project which needs to be investigated and solved because of these principal factors:
- Data Consolidation: If the duplicates are the result of data import errors or other issues, we may need to correct the data import process to prevent such duplicates in the future.
- Data Integration: If the duplicates stem from data integration from multiple sources, we should create a clear integration strategy and perform data transformation to eliminate duplicates.
