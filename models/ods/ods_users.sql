{{
config(
materialized='incremental',
unique_key='user_id',
alias='ods_users'
)
}}
SELECT
user_id::numeric,
first_name::text,
last_name::text,
email::text,
status::text,
load_dttm::timestamp
FROM {{ ref('stg_users') }}