with 

source as (

    select 
        cast(salesorderid as int) as salesorderid
        , cast(salesreasonid as int) as salesreasonid
    from {{ source('raw_sales_aw', 'sales_salesorderheadersalesreason') }}

)

select * from source
