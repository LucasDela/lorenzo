with
    source_salesorderheader as (
        select
            cast(salesorderid as int) as order_id,
            cast(customerid as int) as customer_id,
            cast(territoryid as int) as territory_id,
            cast(creditcardid as int) as creditcard_id,
            cast(orderdate as date) as order_date,
            cast(duedate as date) as due_date,
            cast(shipdate as date) as ship_date,
            cast(status as int) as status,
            cast(subtotal as numeric) as subtotal,
            cast(taxamt as numeric) as tax,
            cast(freight as numeric) as freight,
            cast(totaldue as numeric) as total
        from {{ source('sap', 'salesorderheader') }}
    )
select *
from source_salesorderheader
