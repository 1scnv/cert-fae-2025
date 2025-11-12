with
    source as (
        select
            addressid
            , city
            , postalcode
            , stateprovinceid
        from {{source('raw_person_aw','address')}}
    )

select *
from source