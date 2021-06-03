

  create or replace view `adventureworks-314121`.`dbt_arthur`.`stg_store`
  OPTIONS()
  as with 
    source as (
        select * from `adventureworks-314121`.`adventureworks`.`store`
    )
select * from source;

