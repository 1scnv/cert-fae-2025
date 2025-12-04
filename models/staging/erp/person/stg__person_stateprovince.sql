with
    source as (
        select
            cast(stateprovinceid as int) as stateprovinceid
            , cast(stateprovincecode as string) as stateprovincecode
            , cast(countryregioncode as string) as countryregioncode
            , cast(name as string) as name
        from {{source('raw_person_aw','person_stateprovince')}}
    )

select *
from source