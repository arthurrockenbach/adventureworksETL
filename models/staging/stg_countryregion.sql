with 
    source as (
        select 
         name as country						
         ,countryregioncode as countryregionid
         ,modifieddate			
         ,_sdc_batched_at	
         ,_sdc_extracted_at as last_etl_run
         ,_sdc_table_version
         ,_sdc_received_at	
         ,_sdc_sequence			
        from {{ source('adventureworks', 'countryregion')}}
    )
select * from source 