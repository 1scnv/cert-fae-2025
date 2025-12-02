with

    source as (

        select
            cast(creditcardid as int) as creditcardid
            , cast(cardtype as string) as cardtype
        from {{ source("raw_sales_aw", "sales_creditcard") }}

    )

select *
from source
