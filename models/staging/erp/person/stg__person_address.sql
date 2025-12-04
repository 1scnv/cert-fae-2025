with

    source as (
        select
            cast(addressid as int) as addressid
            , cast(city as string) as city
            , cast(postalcode as string) as postalcode
            , cast(stateprovinceid as int) as stateprovinceid
        from {{ source('raw_person_aw', 'person_address') }}
    )

select *
from source
