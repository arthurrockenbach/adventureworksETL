
    
    




select count(*) as validation_errors
from (
    select product_fk as id from `adventureworks-314121`.`dbt_arthur`.`fact_sales_order`
) as child
left join (
    select product_sk as id from `adventureworks-314121`.`dbt_arthur`.`dim_product`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null


