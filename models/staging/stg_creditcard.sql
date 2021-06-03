with 
    source as (
        select * from {{ source('adventureworks', 'creditcard')}}
    )
select * from source 