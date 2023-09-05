with 
    sum_total as (
        select
            round(sum(total_sales), 2) as total
        from {{ ref('fct_salesdetails') }}
        where order_date between '2011-01-01' and '2011-12-31'
    )

select * from sum_total