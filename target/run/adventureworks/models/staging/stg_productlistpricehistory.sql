

  create or replace view `adventureworks-314121`.`dbt_arthur`.`stg_productlistpricehistory`
  OPTIONS()
  as with 
    source as (
        select * from `adventureworks-314121`.`adventureworks`.`productlistpricehistory`
    )
select * from source;

