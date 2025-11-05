{{ config(materialized='table') }}

select

  cast(order_date as date) as order_date,
  count(*) as orders,
  sum(quantity) as units,
  sum(gross_amount) as gross_revenue,
  sum(total_amount) as revenue,
  sum(total_amount - shipping_cost) as net_revenue
  
from {{ ref('stg_orders') }}
where status in ('shipped', 'completed')
group by 1
order by 1
