with
    source as (
        select
            cast(countryregioncode as int) as countryregioncode
            , cast(name as string) as name
        from {{source('raw_person_aw','person_countryregion')}}
    )

select *
from source