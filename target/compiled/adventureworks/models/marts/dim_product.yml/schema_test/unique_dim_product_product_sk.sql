
    
    



select count(*) as validation_errors
from (

    select
        product_sk

    from `adventureworks-314121`.`dbt_arthur`.`dim_product`
    where product_sk is not null
    group by product_sk
    having count(*) > 1

) validation_errors


