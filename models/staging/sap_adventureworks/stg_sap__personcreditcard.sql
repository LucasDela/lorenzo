with
    source_personcreditcard as (
        select
            cast(businessentityid as int) as client_id,
            cast(creditcardid as int) as creditcard_id
        from {{ source('sap', 'personcreditcard') }}
    )
select *
from source_personcreditcard
