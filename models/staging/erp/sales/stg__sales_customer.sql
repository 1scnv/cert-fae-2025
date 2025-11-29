with

    source as (

        select
            cast(customerid as int) as customerid
            , cast(personid as int) as personid
        from {{ source("raw_sales_aw", "sales_customer") }}

    )

select *
from source
