with order_items as (
    select * from {{ ref('fact_orders_items') }}
),

products as (
    select * from {{ ref('dim_products') }}
),

department_summary as (
    select
        products.department_id,
        count(order_items.order_id) as total_items_sold
    from order_items
    left join products
        on order_items.product_id = products.product_id
    group by 
        products.department_id
)

select * from department_summary