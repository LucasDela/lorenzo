with 
    sum_total as (
        select
            round(sum(subtotal), 2) as total
        from {{ ref('fct_sales') }}
        where order_date between '2011-01-01' and '2011-12-31'
    )

select * from sum_total where total != 12646112.16