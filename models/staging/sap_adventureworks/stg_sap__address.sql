with
    source_address as (
        select
            cast(addressid as int) as address_id,            
            cast(stateprovinceid as int) as state_id,
            address.city as city
        from {{ source('sap', 'address') }}
    )
select *
from source_address
