with 
    source as (
        select 
         stateprovinceid
         ,postalcode
         ,addressid		
         ,city			
         ,addressline2			
         ,modifieddate 
         ,_sdc_batched_at	
         ,_sdc_extracted_at as last_etl_run
         ,_sdc_table_version
         ,_sdc_received_at	
         ,_sdc_sequence						
        from {{ source('adventureworks', 'address')}}
    )
select * from source 