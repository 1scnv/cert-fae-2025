with
    source_credit_card as (
        select
            *
        from {{ ref("stg__sales_creditcard") }}
    ),

    creditcard_renamed as (
        select
            creditcardid as pk_creditcard
            , cardtype as card_type
        from source_credit_card
    )

select *
from creditcard_renamed
