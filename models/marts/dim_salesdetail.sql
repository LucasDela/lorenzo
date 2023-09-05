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
            cast((salesorderheader.order_id || '-' || salesorderdetail.orderdetail_id) as string) as orderdetail_pk
            , salesorderheader.order_id            
            , salesorderdetail.orderdetail_id
            , salesorderdetail.product_id
            , salesorderheader.creditcard_id
            , salesorderheader.customer_id
            , salesorderheader.shiptoaddress_id
            , salesorderheader.status            
            , salesorderheader.order_date
        from salesorderdetail
        left join salesorderheader on salesorderdetail.order_id = salesorderheader.order_id
    )
select *
from dim_salesdetail