with 
    sourcecustomer as (
        select 
            customerid
 
        from `adventureworks-314121`.`dbt_arthur`.`stg_customer`       
    )
    , transformed as (
        select
         row_number () over (order by customerid) as customer_sk 
         ,*
        from sourcecustomer
    )
select distinct * from transformed