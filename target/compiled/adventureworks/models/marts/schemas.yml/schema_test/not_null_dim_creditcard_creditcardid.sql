
    
    



select count(*) as validation_errors
from `adventureworks-314121`.`dbt_arthur`.`dim_creditcard`
where creditcardid is null


