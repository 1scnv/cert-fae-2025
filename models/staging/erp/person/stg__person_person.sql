with 

source as (

    select 
        businessentityid
        , persontype
        , namestyle
        , title
        , firstname
        , middlename
        , lastname
        , suffix
        , emailpromotion
        , additionalcontactinfo
        , demographics
        , rowguid
        , modifieddate
    from {{ source('raw_person_aw', 'person_person') }}

)

select * from source