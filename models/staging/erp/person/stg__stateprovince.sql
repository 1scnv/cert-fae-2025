with
    source as (
        select
            stateprovinceid
            , stateprovincecode
            , countryregioncode
            , name
        from {{source('raw_adventure_works','stateprovince')}}
    )

select *
from source