with
    source as (
        select
            countryregioncode
            , name
        from {{source('raw_person_aw','countryregion')}}
    )

select *
from source