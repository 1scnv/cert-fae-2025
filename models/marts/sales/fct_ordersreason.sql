with
    source as (
        select
            cast(salesorderid as int)     as fk_salesorder,
            cast(salesreasonid as int)    as fk_salesreason
        from {{ source('raw_sales_aw', 'sales_salesorderheadersalesreason') }}
    )

select *
from source
