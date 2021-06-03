with 
    source as (
        select * from {{ source('adventureworks', 'personcreditcard')}}
    )
select * from source 