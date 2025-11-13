with
    source as (
        select
            countryregioncode
            , name
        from {{source('raw_person_aw','person_countryregion')}}
    )

select *
from source