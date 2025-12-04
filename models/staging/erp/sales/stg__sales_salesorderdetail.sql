with

    source as (

        select
            cast(salesorderid as int) as salesorderid
            , cast(salesorderdetailid as int) as salesorderdetailid
            , cast(orderqty as int) as orderqty
            , cast(productid as int) as productid
            , cast(unitprice as double) as unitprice
            , cast(unitpricediscount as double) as unitpricediscount
        from {{ source("raw_sales_aw", "sales_salesorderdetail") }}
    )

select *
from source
