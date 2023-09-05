with
    source_businessentitycontact as (
        select
            cast(businessentityid as int) as businessentity_id
            , cast(personid as int) as person_id
        from {{ source('sap', 'businessentitycontact') }}
    )
select *
from source_businessentitycontact
