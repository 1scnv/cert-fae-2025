with
    source as (
        select
            addressid
            , city
            , postalcode
            , stateprovinceid
        from {{source('raw_person_aw','person_address')}}
    )

select *
from source