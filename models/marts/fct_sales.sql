with
    dim_clients as (
        select *
        from {{ ref('dim_clients') }}
    )
    , dim_location as (
        select *
        from {{ ref('dim_location') }}
    )
    , stg_salesorderheader as (
        select *
        from {{ ref('stg_sap__salesorderheader') }}
    )
    , fct_sales as (
        select
            stg_salesorderheader.order_id
            , dim_clients.creditcard_id
            , stg_salesorderheader.customer_id
            , stg_salesorderheader.shiptoaddress_id
            , dim_location.stateprovince_id
            , dim_location.country_code
            , stg_sap__salesorderheader.status
            , stg_salesorderheader.subtotal
            , stg_salesorderheader.tax
            , stg_salesorderheader.freight
            , stg_salesorderheader.total
            , stg_salesorderheader.order_date
        from stg_salesorderheader
        left join dim_clients on stg_salesorderheader.customer_id = dim_clients.customer_id
        left join dim_location on stg_salesorderheader.shiptoaddress_id = dim_location.address_id
    )
select *
from fct_sales