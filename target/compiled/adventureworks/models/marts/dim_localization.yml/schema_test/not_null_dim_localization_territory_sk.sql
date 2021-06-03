
    
    



select count(*) as validation_errors
from `adventureworks-314121`.`dbt_arthur`.`dim_localization`
where territory_sk is null


