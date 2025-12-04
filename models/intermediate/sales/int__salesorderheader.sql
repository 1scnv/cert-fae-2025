with
    source_salesorderheader as (
        select
            *
        from {{ ref("stg__sales_salesorderheader") }}
    ),

    salesorderheader_renamed as (
        select
            salesorderid as pk_salesorder
            , orderdate as date_order
            , duedate as date_due
            , shipdate as date_ship
            --, status as order_status
            , case
                when source_salesorderheader.status = 1 then 'In Process'
                when source_salesorderheader.status = 2 then 'Approved'
                when source_salesorderheader.status = 3 then 'Backordered'
                when source_salesorderheader.status = 4 then 'Rejected'
                when source_salesorderheader.status = 5 then 'Shipped'
                when source_salesorderheader.status = 6 then 'Cancelled'
                else source_salesorderheader.status 
              end as status
            , customerid as fk_customer
            , salespersonid as fk_salesperson
            , billtoaddressid as fk_billaddress
            , shiptoaddressid as fk_shipaddress
            , shipmethodid as fk_shipmethod
            , creditcardid as fk_creditcard
        from source_salesorderheader
    )

select *
from salesorderheader_renamed
