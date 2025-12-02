with

    source as (
        select
            cast(productid as int) as productid
            , cast(name as string) as name
            , cast(productnumber as string) as productnumber
            , cast(productsubcategoryid as int) as productsubcategoryid
            , cast(productmodelid as int) as productmodelid
        from {{ source('raw_products_aw', 'production_product') }}
    )

select *
from source
