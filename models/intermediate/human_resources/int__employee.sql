with
    source_employee as (
        select
            businessentityid as pk_employee,
            jobtitle as job_title
        from {{ ref("stg__hr_employee") }}
    )

    , source_person as (
        select
            pk_person,
            person_type,
            name_style,
            title,
            first_name,
            middle_name,
            last_name
        from {{ ref("int__persons") }}
    )

    , employee_enriched as (
        select
            employee.pk_employee,
            person.pk_person,
            job_title,
            concat_ws(' ', person.first_name, person.middle_name, person.last_name) as full_name
        from source_employee employee
        left join source_person person 
            on employee.pk_employee = person.pk_person
    )

select *
from employee_enriched
