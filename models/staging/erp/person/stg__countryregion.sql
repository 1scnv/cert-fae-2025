with
    source as (
        select
            countryregioncode
            , name
        from {{source('raw_adventure_works','countryregion')}}
    )

select *
from source