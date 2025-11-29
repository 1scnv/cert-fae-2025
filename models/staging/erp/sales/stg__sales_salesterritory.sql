with

    source as (
        select
            cast(territoryid as int) as territoryid
            , cast(name as string) as name
            , cast(countryregioncode as string) as countryregioncode
            , cast(group as string) as "group"
        from {{ source("raw_sales_aw", "sales_salesterritory") }}
    )

select *
from source
