{{ config(materialized='table') }}

with exploded as (
  select
    q.id as question_id,
    q.creation_date,
    q.answer_count,
    q.score,
    q.view_count,
    case when q.accepted_answer_id is null then 1 else 0 end as is_unanswered,
    tag
  from {{ ref('stg_questions') }} q,
  unnest(REGEXP_EXTRACT_ALL(q.tags, r'<([^>]+)>')) as tag
)

select
  tag as tag_name,
  count(*) as total_questions,
  sum(is_unanswered) as unanswered_questions,
  avg(answer_count) as avg_answer_count,
  avg(score) as avg_score,
  sum(case when answer_count = 0 then 1 else 0 end) as zero_answer_questions
from exploded
group by tag_name
order by unanswered_questions desc
