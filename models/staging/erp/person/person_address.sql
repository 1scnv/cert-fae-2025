with
    source as (
        select
            addressid
            , city
            , postalcode
            , stateprovinceid
        from {{source('raw_adventure_works','address')}}
    )

select *
from source