with 
    source as (
        select 
         stateprovinceid
         ,territoryid
         ,name as statename 			
         ,countryregioncode as countryregionid		
         ,modifieddate			
         ,rowguid									
         ,isonlystateprovinceflag			
         ,stateprovincecode			
         ,_sdc_batched_at	
         ,_sdc_extracted_at as last_etl_run
         ,_sdc_table_version
         ,_sdc_received_at	
         ,_sdc_sequence					
        from `adventureworks-314121`.`adventureworks`.`stateprovince`
    )
select * from source