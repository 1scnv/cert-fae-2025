with 
    source as (
        select
            productsubcategoryid,
            productcategoryid,
            name,
            rowguid,
            modifieddate
        from {{source('raw_products_aw','production_productsubcategory')}}
    )

select *
from source