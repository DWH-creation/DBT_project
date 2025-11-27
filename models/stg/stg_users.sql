{{
config(
materialized='table',
alias='stg_users'
)
}}
SELECT
id::numeric as user_id,
first_name::text as first_name,
last_name::text as last_name,
email::text AS email,
status::text AS status,
CURRENT_TIMESTAMP as load_dttm
FROM {{ ref('raw_users') }}