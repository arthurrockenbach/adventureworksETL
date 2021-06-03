
    
    



select count(*) as validation_errors
from (

    select
        address_sk

    from `adventureworks-314121`.`dbt_arthur`.`dim_localization`
    where address_sk is not null
    group by address_sk
    having count(*) > 1

) validation_errors


