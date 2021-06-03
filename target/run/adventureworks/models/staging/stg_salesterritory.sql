

  create or replace view `adventureworks-314121`.`dbt_arthur`.`stg_salesterritory`
  OPTIONS()
  as with 
    source as (
        select *
         from `adventureworks-314121`.`adventureworks`.`salesterritory`
    )
select * from source;

