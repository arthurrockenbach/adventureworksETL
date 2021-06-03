
    
    



select count(*) as validation_errors
from (

    select
        creditcard_sk

    from `adventureworks-314121`.`dbt_arthur`.`dim_creditcard`
    where creditcard_sk is not null
    group by creditcard_sk
    having count(*) > 1

) validation_errors


