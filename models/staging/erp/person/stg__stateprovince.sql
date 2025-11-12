with
    source as (
        select
            stateprovinceid
            , stateprovincecode
            , countryregioncode
            , name
        from {{source('raw_person_aw','stateprovince')}}
    )

select *
from source