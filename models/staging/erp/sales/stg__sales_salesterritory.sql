with 

source as (

    select 
        territoryid
        , name
        , countryregioncode
        , group
        , salesytd
        , saleslastyear
        , costytd
        , costlastyear
        , rowguid
        , modifieddate
    from {{ source('raw_sales_aw', 'sales_salesterritory') }}

)

select * from source
