with

    source as (
        select
            cast(productsubcategoryid as int) as productsubcategoryid
            , cast(productcategoryid as int) as productcategoryid
            , cast(name as string) as name
        from {{ source('raw_products_aw', 'production_productsubcategory') }}
    )

select *
from source
