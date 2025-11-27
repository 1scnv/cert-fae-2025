with 

source as (

    select 
        salesorderid
        , salesreasonid
    from {{ source('raw_sales_aw', 'sales_salesorderheadersalesreason') }}

)

select * from source
