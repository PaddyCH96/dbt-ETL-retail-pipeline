with orders as (
    select * from stg_orders
),

order_items as (
    select * from stg_order_products
),

final as (
    select
        order_items.order_id,
        order_items.product_id,
        orders.user_id,
        orders.order_day_of_week,
        orders.order_hour_of_day,
        order_items.add_to_cart_order,
        order_items.reordered
    from order_items
    left join orders 
        on order_items.order_id = orders.order_id
)

select * from final