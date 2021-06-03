with 
    sourcecustomer as (
        select 
            customerid
 
        from {{ ref('stg_customer')}}       
    )
    , transformed as (
        select
         row_number () over (order by customerid) as customer_sk 
         ,*
        from sourcecustomer
    )
select distinct * from transformed
