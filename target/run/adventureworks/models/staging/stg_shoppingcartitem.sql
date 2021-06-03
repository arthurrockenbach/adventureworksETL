

  create or replace view `adventureworks-314121`.`dbt_arthur`.`stg_shoppingcartitem`
  OPTIONS()
  as with 
    source as (
        select * from `adventureworks-314121`.`adventureworks`.`shoppingcartitem`
    )
select * from source;

