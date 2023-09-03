with
    salesorderheader as (
        select *
        from {{ ref('stg_sap__salesorderheader') }}
    )
    , salesorderdetail as (
        select *
        from {{ ref('stg_sap__salesorderdetail') }}
    )
    , dim_salesdetail as (
        select
            salesorderdetail.orderdetail_id
            , salesorderheader.order_id
            , salesorderdetail.product_id
            , salesorderheader.territory_id
            , salesorderdetail.offer_id
            , salesorderheader.creditcard_id
            , salesorderheader.customer_id
            , salesorderheader.order_date
            , salesorderheader.due_date
            , salesorderheader.ship_date
            , salesorderheader.status
        from salesorderdetail
        left join salesorderheader on salesorderdetail.order_id = salesorderheader.order_id
    )
select *
from dim_salesdetail