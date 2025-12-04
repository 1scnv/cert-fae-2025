with sales_2011 as (
    select
        sum(total_price) as total_sales_2011
    from {{ ref('int__sales') }}
    where year(date_order) = 2011
)

select *
from sales_2011
where round(total_sales_2011, 2) != 12646112.16
