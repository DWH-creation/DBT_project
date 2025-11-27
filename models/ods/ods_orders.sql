{{
config(
materialized='incremental',
unique_key='order_id',
alias='ods_orders'
)
}}
SELECT
order_id::numeric,
user_id::numeric,
order_amount::float,
order_status::text,
order_date::date,
load_dttm::timestamp
FROM {{ ref('stg_orders') }}
