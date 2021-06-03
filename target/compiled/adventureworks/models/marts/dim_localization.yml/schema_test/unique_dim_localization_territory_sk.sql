
    
    



select count(*) as validation_errors
from (

    select
        territory_sk

    from `adventureworks-314121`.`dbt_arthur`.`dim_localization`
    where territory_sk is not null
    group by territory_sk
    having count(*) > 1

) validation_errors


