
with dbt__CTE__INTERNAL_test as (
with 
   validation as (
    select sum(orderqty) as sum_qty
    from `adventureworks-314121`.`dbt_arthur`.`fact_sales_order` 
   )
select * from validation where sum_qty != 274914
)select count(*) from dbt__CTE__INTERNAL_test