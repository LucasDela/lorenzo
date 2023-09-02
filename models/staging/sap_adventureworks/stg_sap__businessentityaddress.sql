with
    source_businessentityaddress as (
        select
            cast(businessentityid as int) as client_id,            
            cast(addressid as int) as address_id
        from {{ source('sap', 'businessentityaddress') }}
    )
select *
from source_businessentityaddress
