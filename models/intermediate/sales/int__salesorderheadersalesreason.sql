with
    source_salesorderheadersalesreason as (
        select
            *
        from {{ ref("stg__sales_salesorderheadersalesreason") }}
    ),

    reasonheader_renamed as (
        select
            salesorderid as pk_salesorder
            , salesreasonid as pk_salesreason
        from source_salesorderheadersalesreason
    )

select *
from reasonheader_renamed
