with 
    source as (
        select * from {{ source('adventureworks', 'store')}}
    )
select * from source 