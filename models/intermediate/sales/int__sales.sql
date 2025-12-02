with 
    order_header as(
        select
            pk_salesorder,
            date_order,
            date_due,
            date_ship,
            status,
            fk_customer,
            fk_salesperson,
            fk_billaddress,
            fk_shipaddress,
            fk_shipmethod,
            fk_creditcard
        from {{ ref("int__salesorderheader") }}
    )

    , order_detail as (
        select
            pk_salesorderdetail,
            fk_salesorder,
            fk_product,
            quantity_ordered,
            unit_price,
            unit_price_discount,
            (unit_price * quantity_ordered) as total_price,
            (unit_price * quantity_ordered) * (1 - unit_price_discount) as total_net
        from {{ ref("int__salesorderdetail") }}
    )

    , order_reason as (
        select
            pk_reason,
            reason,
            reason_type
        from {{ ref("int__salesorderreason") }}
    )

    , order_reason_header as (
        select
            pk_salesorder,
            string_agg(cast(pk_salesreason as string), ', ') as reason_list
        from {{ ref("int__salesorderheadersalesreason") }}
        group by pk_salesorder
    )

    , joined as (
        select
            /* order_detail */
            detail.pk_salesorderdetail,
            detail.fk_salesorder,
            detail.fk_product,
            detail.quantity_ordered,
            detail.unit_price,
            detail.unit_price_discount,
            detail.total_price,
            detail.total_net,

            /* order_header */
            header.date_order,
            header.date_due,
            header.date_ship,
            header.status,
            header.fk_customer,
            header.fk_salesperson,
            header.fk_billaddress,
            header.fk_shipaddress,
            header.fk_shipmethod,
            header.fk_creditcard,

            /* reason agg */
            reason_header.reason_list

        from order_detail detail
        left join order_header header 
            on detail.fk_salesorder = header.pk_salesorder

        left join order_reason_header reason_header
            on detail.fk_salesorder = reason_header.pk_salesorder
    )

select *
from joined
