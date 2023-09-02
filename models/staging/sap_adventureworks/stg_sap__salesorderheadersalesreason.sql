with
    source_salesorderheadersalesreason as (
        select
            cast(salesorderid as int) as order_id,            
            cast(salesreasonid as int) as reason_id
        from {{ source('sap', 'salesorderheadersalesreason') }}
    )
select *
from source_salesorderheadersalesreason