with
    source_person as (
        select
            cast(businessentityid as int) as businessentity_id
            , cast(firstname || ' ' || lastname as string) as full_name
        from {{ source('sap', 'person') }}
    )
select *
from source_person
