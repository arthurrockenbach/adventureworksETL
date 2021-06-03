
    
    




select count(*) as validation_errors
from (
    select creditcard_fk as id from `adventureworks-314121`.`dbt_arthur`.`fact_sales_order`
) as child
left join (
    select creditcard_sk as id from `adventureworks-314121`.`dbt_arthur`.`dim_creditcard`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null


