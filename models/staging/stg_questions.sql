select
  id as question_id,
  owner_user_id,
  title,
  body,
  accepted_answer_id,
  answer_count,
  comment_count,
  favorite_count,
  creation_date,
  score,
  view_count
from `bigquery-public-data.stackoverflow.posts_questions`
