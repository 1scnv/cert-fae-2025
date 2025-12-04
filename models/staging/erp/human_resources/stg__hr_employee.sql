with
    source as (
        select
            cast(businessentityid as int) as businessentityid
            , cast(jobtitle as string) as jobtitle
        from {{source('raw_person_aw','humanresources_employee')}}
    )

select *
from source