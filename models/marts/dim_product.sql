with 
    sourceproduct as (
        select distinct
            productid 
            ,productname       				
        from {{ ref('stg_product')}} 
    )
    , transformedproduct as (
        select
          row_number() over(order by productid) as product_sk 
           , *
        from sourceproduct
    )
select * from transformedproduct