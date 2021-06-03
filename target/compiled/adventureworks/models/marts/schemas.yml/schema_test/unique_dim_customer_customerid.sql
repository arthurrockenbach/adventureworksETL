
    
    



select count(*) as validation_errors
from (

    select
        customerid

    from `adventureworks-314121`.`dbt_arthur`.`dim_customer`
    where customerid is not null
    group by customerid
    having count(*) > 1

) validation_errors


