with
    source_salesorderreason as (
        select * from {{ ref('int__salesource_salesorderreason') }}
    )

select * from source_salesorderreason