
    
    



select count(*) as validation_errors
from (

    select
        creditcardid

    from `adventureworks-314121`.`dbt_arthur`.`dim_creditcard`
    where creditcardid is not null
    group by creditcardid
    having count(*) > 1

) validation_errors


