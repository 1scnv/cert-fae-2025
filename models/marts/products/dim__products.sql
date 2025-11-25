with
    source_products as (
        select * from {{ ref('int__products') }}
    )

select * from source_products