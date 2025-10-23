with src as (select * from "mini_lake"."main"."members")
select
  cast(member_id as integer) as member_id,
  cast(joined_date as date)  as joined_date,
  upper(trim(plan))          as plan,
  trim(home_gym)             as home_gym
from src;