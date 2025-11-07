select
  id as answer_id,
  question_id,
  owner_user_id,
  body,
  creation_date,
  score
from `bigquery-public-data.stackoverflow.posts_answers`
