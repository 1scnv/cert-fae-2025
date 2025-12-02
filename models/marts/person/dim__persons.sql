with
    source_persons as (
        select * from {{ ref('int__persons') }}
    )

select * from source_persons