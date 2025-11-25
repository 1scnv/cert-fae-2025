with
    source_employee as (
        select * from {{ ref('int__employee') }}
    )

select * from source_employee