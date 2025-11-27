{{
config(
materialized='table',
alias='stg_orders'
)
}}
SELECT
order_id::numeric as order_id,
user_id::numeric as user_id,
amount::numeric as order_amount,
status::text as order_status,
order_date::date as order_date,
CURRENT_TIMESTAMP as load_dttm
FROM {{ ref('raw_orders') }}
