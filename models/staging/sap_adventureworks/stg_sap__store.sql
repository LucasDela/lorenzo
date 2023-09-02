with
    source_store as (
        select
            cast(businessentityid as int) as client_id,
            store.name as clientname
        from {{ source('sap', 'store') }}
    )
select *
from source_store
