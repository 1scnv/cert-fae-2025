with 

source as (

    select 
        businessentityid
        , territoryid
        , salesquota
        , bonus
        , commissionpct
        , salesytd
        , saleslastyear
        , rowguid
        , modifieddate
    from {{ source('raw_sales_aw', 'sales_salesperson') }}

)

select * from source
