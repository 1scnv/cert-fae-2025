with
    source_regions as (
        select * from {{ ref('int__regions') }}
    )

select * from source_regions