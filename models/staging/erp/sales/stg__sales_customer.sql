with 

source as (

    select 
        customerid
        , personid
        , storeid
        , territoryid
        , rowguid
        , modifieddate
    from {{ source('raw_sales_aw', 'sales_customer') }}

)

select * from source
