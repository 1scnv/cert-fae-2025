with 

source as (

    select 
        customerid
        , personid
    from {{ source('raw_sales_aw', 'sales_customer') }}

)

select * from source
