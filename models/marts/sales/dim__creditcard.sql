with
    source_creditcard as (
        select * from {{ ref('int__creditcard') }}
    )

select * from source_creditcard