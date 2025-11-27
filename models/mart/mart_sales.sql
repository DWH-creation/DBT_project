{{
config(
materialized='view',
alias='mart_sales'
)
}}
with t1 as (
    select 
        order_id,
        user_id,
        sum(order_amount) as order_amount,
        order_status,
        extract(MONTH from order_date) as order_month
    from {{ ref('ods_orders') }}
    where order_status='completed'
    group by 
        order_id,
        user_id,
        order_status,
        extract(MONTH from order_date)
    ),
    t2 as (
    select 
        user_id,
        first_name ||' ' || last_name as full_name,
        email
    from {{ ref('ods_users') }}
    ),
    final as (
        select 
            t1.order_month,
            t1.order_id,
            t1.user_id,
            t2.full_name,
            t2.email,
            t1.order_amount,
            t1.order_status
        from t1 
        left join t2 using (user_id)
        )
    select *
    from final