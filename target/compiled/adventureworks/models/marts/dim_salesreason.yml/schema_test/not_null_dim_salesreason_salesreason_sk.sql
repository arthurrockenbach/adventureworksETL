
    
    



select count(*) as validation_errors
from `adventureworks-314121`.`dbt_arthur`.`dim_salesreason`
where salesreason_sk is null


