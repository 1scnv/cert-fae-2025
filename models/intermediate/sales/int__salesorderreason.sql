with
    source_salesorderreason as (
        select
            *
        from {{ ref("stg__sales_salesreason") }}
    ),

    salesorderreason_renamed as (
        select
        salesreasonid as pk_reason,
        name as reason,
        reasontype as reason_type
        from source_salesorderreason
    )

select *
from salesorderreason_renamed
