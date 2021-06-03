
    
    



select count(*) as validation_errors
from `adventureworks-314121`.`dbt_arthur`.`dim_localization`
where address_sk is null


