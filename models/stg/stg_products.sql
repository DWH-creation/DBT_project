{{
config(
materialized='table',
alias='stg_products'
)
}}
SELECT
id::numeric as product_id,
name::text as product_name,
category::text as product_category,
price::text as product_price,
CURRENT_TIMESTAMP as load_dttm
FROM {{ ref('raw_products') }}