with
    source as (
        select
            cast(countryregioncode as string) as countryregioncode
            , cast(name as string) as name
        from {{source('raw_person_aw','person_countryregion')}}
    )

select *
from source