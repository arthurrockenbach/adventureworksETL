
    
    



select count(*) as validation_errors
from (

    select
        salesorderid

    from `adventureworks-314121`.`dbt_arthur`.`fact_sales_order`
    where salesorderid is not null
    group by salesorderid
    having count(*) > 1

) validation_errors


