with 

source as (

    select 
        salesreasonid,
        name,
        reasontype,
        modifieddate
    from {{ source('raw_sales_aw', 'sales_salesreason') }}

)

select * from source