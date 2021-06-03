with 
   validation as (
    select sum(orderqty) as sum_qty
    from {{ref('fact_sales_order')}} 
   )
select * from validation where sum_qty != 274914