Stack Overflow Data Analysis

Author: Ruslan Zakruzhetskyi
Email: rusuk264@gmail.com
Presentation  [https://docs.google.com/presentation/d/1SvC6fBxeS4jJfGgYxIeEoCZKFM7LG_5r1SaigOrRwdI/edit?usp=sharing]





Project Objective

To answer the question: “Which topics have the highest need for answers?”
Using Stack Overflow data to analyze under-served or unanswered topics.

2. Data Source
BigQuery Public Dataset: bigquery-public-data.stackoverflow
Tables used:
posts_questions
posts_answers
posts_tags
Custom tables (BigQuery dataset stackoverflow_models):
stg_questions
stg_answers
stg_tags
dim_tags
fact_questions

3. Star Schema
Fact Table: fact_questions (contains question_id, title, answer_id, score, answer_count, tag_name)
Dimension Table: dim_tags (tag_id, tag_name)
Staging Tables: stg_* (data cleaning and preparation)
Assumptions:
For BigQuery free tier limits, row limit = 100 was applied during processing.
answer_id IS NULL is used to identify unanswered questions.

Star Schema Screenshot: see slide 3 in the presentation.


Looker Studio Dashboard

Dashboard link (public): [https://lookerstudio.google.com/reporting/3f50d190-816f-47a6-89bd-0b6412ab32a2]

Visualizations:

Table → title, answer_count, score

Bar Chart → tags with the highest number of unanswered questions
