with 
    source as (
        select * from {{ source ('adventureworks', 'productlistpricehistory')}}
    )
select * from source 
