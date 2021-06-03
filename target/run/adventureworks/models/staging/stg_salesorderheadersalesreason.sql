

  create or replace view `adventureworks-314121`.`dbt_arthur`.`stg_salesorderheadersalesreason`
  OPTIONS()
  as with 
    source as (
        select distinct * from `adventureworks-314121`.`adventureworks`.`salesorderheadersalesreason`
    )
select * from source;

