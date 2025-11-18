with
    source_customer as (
        select 
            customerid as pk_customer,
            personid as fk_person
        from {{ ref("stg__sales_customer") }}
    ),

    source_person as (
        select
            businessentityid as pk_person,
            firstname as first_name,
            middlename as middle_name,
            lastname as last_name
        from {{ ref("stg__person_person") }}
    ),

    customer_enriched as (
        select
            customer.pk_customer,
            customer.fk_person,
            concat_ws(' ', person.first_name, person.middle_name, person.last_name) as full_name
        from source_customer customer
        left join source_person person 
            on customer.fk_person = person.pk_person
    )

select *
from customer_enriched;
