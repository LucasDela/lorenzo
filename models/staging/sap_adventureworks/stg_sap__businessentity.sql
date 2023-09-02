with
    source_businessentity as (
        select
            cast(businessentityid as int) as client_id
        from {{ source('sap', 'businessentity') }}
    )
select *
from source_businessentity
