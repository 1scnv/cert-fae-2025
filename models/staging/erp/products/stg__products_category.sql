with

    source as (
        select
            cast(productcategoryid as int) as productcategoryid
            , cast(name as string) as name
        from {{ source('raw_products_aw', 'production_productcategory') }}
    )

select *
from source
