with
    source_city as (
        select
            addressid as pk_address,
            stateprovinceid as fk_state,
            city as city_name,
            postalcode as postal_code
        from {{ ref("stg__person_address") }}
    ),

    source_state_province as (
        select
            stateprovinceid as pk_state,
            stateprovincecode as code_state_province,
            countryregioncode as fk_country,
            name as state_province_name
        from {{ ref("stg__person_stateprovince") }}
    ),

    source_country_region as (
        select 
            countryregioncode as pk_country,
            name as country_name
        from {{ ref("stg__person_countryregion") }}
    ),

    region_enrich as (
        select
            city.pk_address,
            state_province.pk_state,
            city.city_name,
            city.postal_code,
            state_province.state_province_name,
            state_province.code_state_province,
            state_province.fk_country,
            country_region.country_name
        from source_city city
        left join source_state_province state_province
            on city.fk_state = state_province.pk_state
        left join source_country_region country_region
            on country_region.pk_country = state_province.fk_country
    )

select *
from region_enrich
