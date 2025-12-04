with
    source_salesorderreason as (
        select * from {{ ref('int__salesorderreason') }}
    )

select * from source_salesorderreason