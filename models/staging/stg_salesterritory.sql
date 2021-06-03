with 
    source as (
        select *
         from {{ source('adventureworks', 'salesterritory')}}
    )
select * from source 