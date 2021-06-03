

  create or replace view `adventureworks-314121`.`dbt_arthur`.`stg_personcreditcard`
  OPTIONS()
  as with 
    source as (
        select * from `adventureworks-314121`.`adventureworks`.`personcreditcard`
    )
select * from source;

