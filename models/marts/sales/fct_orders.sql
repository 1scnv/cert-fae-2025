with
    source_sales as (
        select * from {{ ref('int__sales') }}
    )

select * from source_sales