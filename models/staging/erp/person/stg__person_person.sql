with 

source as (

    select 
        cast(businessentityid as int) as businessentityid
        , cast(persontype as string) as persontype
        , cast(namestyle as boolean) as namestyle
        , cast(title as string) as title
        , cast(firstname as string) as firstname
        , cast(nullif(middlename, '') as string) as middlename
        , cast(nullif(lastname, '') as string) as lastname
        , cast(suffix as string) as suffix
    from {{ source('raw_person_aw', 'person_person') }}

)

select * from source