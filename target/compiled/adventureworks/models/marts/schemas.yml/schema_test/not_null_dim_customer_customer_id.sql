
    
    



select count(*) as validation_errors
from `adventureworks-314121`.`dbt_arthur`.`dim_customer`
where customer_id is null


