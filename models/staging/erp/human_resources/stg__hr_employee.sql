with
    source as (
        select
            businessentityid,
            jobtitle
        from {{source('raw_person_aw','humanresources_employee')}}
    )

select *
from source