with
    source_customer as (
        select * from {{ ref('int__customers') }}
    )

select * from source_customer