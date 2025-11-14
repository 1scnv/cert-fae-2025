with
    person as (
        select
            businessentityid as pk_person,
            persontype as person_type,
            namestyle as name_style,
            title as title,
            firstname as first_name,
            middlename as middle_name,
            lastname as last_name,
            suffix as suffix,
            emailpromotion as email_promotion,
            modifieddate as modified_date
        from {{ ref("stg__person_person") }}
    )



select *
from person
