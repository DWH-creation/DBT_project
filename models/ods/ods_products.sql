{{
config(
materialized='incremental',
unique_key='product_id',
alias='ods_products'
)
}}
SELECT
product_id::numeric,
product_name::text,
product_category::text,
product_price::float,
load_dttm:: timestamp
FROM {{ ref('stg_products') }}