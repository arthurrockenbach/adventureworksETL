with 
    source as (
        select 
            businessentityid
            ,firstname 
            ,lastname
            ,persontype
            ,namestyle
            ,suffix	
            ,modifieddate
            ,rowguid
            ,emailpromotion			
            ,middlename
            ,_sdc_batched_at			
            ,_sdc_extracted_at as last_etl_run           			
            ,_sdc_received_at			
            ,_sdc_sequence
            ,_sdc_table_version	        
        from `adventureworks-314121`.`adventureworks`.`person`
    )
select * from source