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
    from {{ source('raw_adventure_works', 'person') }}

)

select * from source