with
    businessentity as (
        select *
        from {{ ref('stg_sap__businessentity') }}
    )
    , store as (
        select *
        from {{ ref('stg_sap__store') }}
    )
    , creditcard as (
        select *
        from {{ ref('stg_sap__creditcard') }}
    )
    , personcreditcard as (
        select *
        from {{ ref('stg_sap__personcreditcard') }}
    ) 
    , dim_clients as (
        select
            businessentity.client_id
            , personcreditcard.creditcard_id
            , store.clientname
            , creditcard.cardtype
        from businessentity
        left join store on businessentity.client_id = store.client_id
        left join personcreditcard on businessentity.client_id = personcreditcard.client_id
        left join creditcard on personcreditcard.creditcard_id = creditcard.creditcard_id
    )
select *
from dim_clients