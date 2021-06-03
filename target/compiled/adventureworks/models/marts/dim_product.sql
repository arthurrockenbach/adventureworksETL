with 
    sourceproduct as (
        select distinct
            productid 
            ,productname       				
        from `adventureworks-314121`.`dbt_arthur`.`stg_product` 
    )
    , transformedproduct as (
        select
          row_number() over(order by productid) as product_sk 
           , *
        from sourceproduct
    )
select * from transformedproduct