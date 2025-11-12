with 
    source as (
        select
            productcategoryid,
            name,
            rowguid,
            modifieddate
        from {{source('raw_products_aw','productcategory')}}
    )

select *
from source