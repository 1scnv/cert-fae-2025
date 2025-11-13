with 
    source as (
        select
            productcategoryid,
            name,
            rowguid,
            modifieddate
        from {{source('raw_products_aw','production_productcategory')}}
    )

select *
from source