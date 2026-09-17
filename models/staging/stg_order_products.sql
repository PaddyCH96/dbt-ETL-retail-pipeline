with source as (
    select * from {{ source('raw', 'raw_order_products') }}
),

renamed as (
    select
        order_id,
        product_id,
        add_to_cart_order,
        reordered
    from source
)

select * from renamed