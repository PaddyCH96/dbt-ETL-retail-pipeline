with order_items as (
    select * from {{ ref('fact_orders_items') }}
),

traffic_summary as (
    select
        order_day_of_week,
        order_hour_of_day,
        count(distinct order_id) as total_orders
    from order_items
    group by 
        order_day_of_week,
        order_hour_of_day
)

select * from traffic_summary