{{ config(materialized='view') }}

select

  order_id,
  order_date,
  customer_id,
  country,
  state,
  city,
  product_category,
  product_id,
  quantity,
  unit_price,
  discount,
  (quantity * unit_price) as gross_amount,
  total_amount,
  payment_method,
  is_first_purchase,
  channel,
  status,
  ship_date,
  shipping_cost

from {{ ref('orders') }}
