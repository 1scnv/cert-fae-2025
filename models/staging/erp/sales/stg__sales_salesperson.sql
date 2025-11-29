with

    source as (
        select
            cast(businessentityid as int) as businessentityid
            , cast(territoryid as int) as territoryid
        from {{ source("raw_sales_aw", "sales_salesperson") }}
    )

select *
from source
