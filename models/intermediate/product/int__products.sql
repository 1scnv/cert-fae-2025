with
    source_product as (
        select
            productid as pk_product,
            productsubcategoryid as fk_subcategory,
            name as product_name,
            productnumber as product_number
        from {{ ref("stg__products_product") }}
    ),

    source_subcategory as (
        select
            productsubcategoryid as pk_subcategory,
            productcategoryid as fk_category,
            name as subcategory_name
        from {{ ref("stg__products_productsubcategory") }}
    ),

    source_category as (
        select 
            productcategoryid as pk_category,
            name as category_name
        from {{ ref("stg__products_category") }}
    ),

    products_enriched as (
        select
            product.pk_product,
            product.fk_subcategory,
            subcategory.fk_category,
            product.product_name,
            product.product_number,
            subcategory.subcategory_name,
            category.category_name
        from source_product product
        left join
            source_subcategory subcategory
            on product.fk_subcategory = subcategory.pk_subcategory
        left join
            source_category category on subcategory.fk_category = category.pk_category
    )

select *
from products_enriched
