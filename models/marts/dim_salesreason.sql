with
    salesreason as (
        select *
        from {{ ref('stg_sap__salesreason') }}
    )
    , salesorderheadersalesreason as (
        select *
        from {{ ref('stg_sap__salesorderheadersalesreason') }}
    )
    , dim_salesreason as (
        select
            cast((salesorderheadersalesreason.order_id || '-' || salesorderheadersalesreason.reason_id) as string) as reason_pk
            ,salesorderheadersalesreason.order_id
            , salesorderheadersalesreason.reason_id
            , salesreason.reason
            , salesreason.reason_type
        from salesorderheadersalesreason
        left join salesreason on salesorderheadersalesreason.reason_id = salesreason.reason_id
    )
select *
from dim_salesreason