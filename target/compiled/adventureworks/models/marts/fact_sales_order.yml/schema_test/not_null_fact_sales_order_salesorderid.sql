
    
    



select count(*) as validation_errors
from `adventureworks-314121`.`dbt_arthur`.`fact_sales_order`
where salesorderid is null


