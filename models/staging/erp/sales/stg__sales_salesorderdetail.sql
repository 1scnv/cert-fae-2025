with 

source as (

    select 
        salesorderid
        , salesorderdetailid
        , carriertrackingnumber
        , orderqty
        , productid
        , specialofferid
        , unitprice
        , unitpricediscount
        , rowguid
        , modifieddate
    from {{ source('raw_sales_aw', 'sales_salesorderdetail') }}

)

select * from source
