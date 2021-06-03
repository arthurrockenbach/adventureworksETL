

  create or replace view `adventureworks-314121`.`dbt_arthur`.`stg_creditcard`
  OPTIONS()
  as with 
    source as (
        select * from `adventureworks-314121`.`adventureworks`.`creditcard`
    )
select * from source;

