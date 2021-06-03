
    
    



select count(*) as validation_errors
from (

    select
        salesreason_sk

    from `adventureworks-314121`.`dbt_arthur`.`dim_salesreason`
    where salesreason_sk is not null
    group by salesreason_sk
    having count(*) > 1

) validation_errors


