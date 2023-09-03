with
    source_salesorderheader as (
        select
            cast(salesorderid as int) as order_id,
            cast(customerid as int) as customer_id,
            cast(territoryid as int) as territory_id,
            cast(creditcardid as int) as creditcard_id,
            cast(shiptoaddressid as int) as shiptoaddress_id,
            DATE(orderdate) as order_date,
            DATE(duedate) as due_date,
            DATE(shipdate) as ship_date,
            cast(status as int) as status,
            cast(subtotal as numeric) as subtotal,
            cast(taxamt as numeric) as tax,
            cast(freight as numeric) as freight,
            cast(totaldue as numeric) as total
        from {{ source('sap', 'salesorderheader') }}
    )
select *
from source_salesorderheader
