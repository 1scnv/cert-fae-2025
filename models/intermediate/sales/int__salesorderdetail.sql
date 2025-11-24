with
    source_salesorderdetail as (
        select
            *
        from {{ ref("stg__sales_salesorderdetail") }}
    ),

    details_renamed as (
        select
            salesorderdetailid as pk_salesorderdetail,
            salesorderid as fk_salesorder,
            productid as fk_product,
            orderqty as quantity_ordered,
            unitprice as unit_price,
            unitpricediscount as unit_price_discount
        from source_salesorderdetail
    )

select *
from details_renamed
