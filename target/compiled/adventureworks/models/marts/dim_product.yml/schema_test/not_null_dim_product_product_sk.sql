
    
    



select count(*) as validation_errors
from `adventureworks-314121`.`dbt_arthur`.`dim_product`
where product_sk is null


