with order_items as (
    select * from {{ ref('fact_orders_items') }}
),

reorder_summary as (
    select
        product_id,
        count(order_id) as total_purchases,
        sum(reordered) as total_reorders,
        round(sum(reordered)::numeric / count(order_id), 4) as reorder_rate
    from order_items
    group by product_id
)

select * from reorder_summary