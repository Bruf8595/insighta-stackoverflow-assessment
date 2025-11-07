{{ config(materialized='table') }}

with exploded as (
  select
    q.id as question_id,
    tag
  from {{ ref('stg_questions') }} q,
  unnest(REGEXP_EXTRACT_ALL(q.tags, r'<([^>]+)>')) as tag
)

select
  tag as tag_name,
  count(distinct question_id) as question_count
from exploded
group by tag_name
order by question_count desc
