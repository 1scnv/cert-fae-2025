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
            , status as order_status
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
