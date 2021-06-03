
    
    




select count(*) as validation_errors
from (
    select salesreason_fk as id from `adventureworks-314121`.`dbt_arthur`.`fact_sales_order`
) as child
left join (
    select salesreason_sk as id from `adventureworks-314121`.`dbt_arthur`.`dim_salesreason`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null


