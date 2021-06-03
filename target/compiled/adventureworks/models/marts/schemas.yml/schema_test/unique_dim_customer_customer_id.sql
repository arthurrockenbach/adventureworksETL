
    
    



select count(*) as validation_errors
from (

    select
        customer_id

    from `adventureworks-314121`.`dbt_arthur`.`dim_customer`
    where customer_id is not null
    group by customer_id
    having count(*) > 1

) validation_errors


