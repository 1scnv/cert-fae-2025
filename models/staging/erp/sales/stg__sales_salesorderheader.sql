with 

source as (

    select 
        cast(salesorderid as int)   as salesorderid
        , cast(revisionnumber as int) as revisionnumber
        , cast(orderdate as date) as orderdate
        , cast(duedate as date) as duedate
        , cast(shipdate as date) as shipdate
        , try_cast(status as string) as status
        , cast(onlineorderflag as boolean) as onlineorderflag
        , cast(customerid as int) as customerid
        , cast(salespersonid as int) as salespersonid
        , cast(territoryid as int) as territoryid
        , cast(billtoaddressid as int) as billtoaddressid
        , cast(shiptoaddressid as int) as shiptoaddressid
        , cast(shipmethodid as int) as shipmethodid
        , cast(creditcardid as int) as creditcardid
        , cast(currencyrateid as int) as currencyrateid
        , cast(subtotal as double) as subtotal
        , cast(taxamt as double) as taxamt
        , cast(freight as double) as freight
        , cast(totaldue as double) as totaldue
    from {{ source('raw_sales_aw', 'sales_salesorderheader') }}

)

select *
from source
