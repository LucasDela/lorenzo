with
    customer as (
        select *
        from {{ ref('stg_sap__customer') }}
    )
    , person as (
        select *
        from {{ ref('stg_sap__person') }}
    )
    , personcreditcard as (
        select *
        from {{ ref('stg_sap__personcreditcard') }}
    )
    , creditcard as (
        select *
        from {{ ref('stg_sap__creditcard') }}
    )
    , dim_clients as (
        select
            customer.customer_id
            , customer.person_id
            , creditcard.creditcard_id
            , customer.territory_id
            , person.full_name
            , creditcard.cardtype
        from customer
        left join person on customer.person_id = person.businessentity_id
        left join personcreditcard on person.businessentity_id = personcreditcard.client_id
        left join creditcard on personcreditcard.creditcard_id = creditcard.creditcard_id
    )
select *
from dim_clients