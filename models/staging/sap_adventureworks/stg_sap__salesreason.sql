with
    source_salesreason as (
        select
            cast(salesreasonid as int) as reason_id,
            salesreason.name as reason,
            salesreason.reasontype as reason_type
        from {{ source('sap', 'salesreason') }}
    )
select *
from source_salesreason
