with

    source as (
        select
            cast(salesreasonid as int) as salesreasonid
            , cast(name as string) as name
            , cast(reasontype as string) as reasontype
        from {{ source("raw_sales_aw", "sales_salesreason") }}
    )

select *
from source
