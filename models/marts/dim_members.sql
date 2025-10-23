select
  member_id,
  joined_date,
  date_trunc('month', joined_date) as join_month,
  plan,
  home_gym
from {{ ref('stg_members') }};
