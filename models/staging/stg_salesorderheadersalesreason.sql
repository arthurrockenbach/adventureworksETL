with 
    source as (
        select distinct * from {{ source('adventureworks', 'salesorderheadersalesreason')}}
    )
select * from source 