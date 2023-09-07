with
    dim_salesdetail as (
        select *
        from {{ ref('dim_salesdetail') }}
    )
    , dim_location as (
        select *
        from {{ ref('dim_location') }}
    )
    , stg_salesorderheader as (
        select *
        from {{ ref('stg_sap__salesorderheader') }}
    )
    , stg_salesorderdetail as (
        select *
        from {{ ref('stg_sap__salesorderdetail') }}
    )
    , fct_salesdetails as (
        select
            dim_salesdetail.orderdetail_pk
            , dim_salesdetail.order_id
            , dim_salesdetail.orderdetail_id
            , dim_salesdetail.product_id
            , dim_salesdetail.creditcard_id
            , dim_salesdetail.customer_id
            , stg_salesorderheader.shiptoaddress_id
            , dim_location.stateprovince_id
            , dim_location.country_code
            , dim_salesdetail.order_date
            , stg_salesorderdetail.order_qty
            , stg_salesorderdetail.unit_price
            , stg_salesorderdetail.discount as unitprice_discount
            , stg_salesorderheader.total
            , cast(unit_price * order_qty as numeric) as total_sales
        from dim_salesdetail
        left join dim_location on dim_salesdetail.shiptoaddress_id = dim_location.address_id
        left join stg_salesorderdetail on dim_salesdetail.orderdetail_id = stg_salesorderdetail.orderdetail_id
        left join stg_salesorderheader on dim_salesdetail.order_id = stg_salesorderheader.order_id
    )
select *
from fct_salesdetails