with 
    source as (
        select 
            productid
            ,productsubcategoryid		
            ,productmodelid   
            ,name as productname         
            ,safetystocklevel			
            ,class						
            ,productnumber						
            ,modifieddate			
            ,rowguid						
            ,weightunitmeasurecode			
            ,standardcost									
            ,sizeunitmeasurecode										
            ,listprice						
            ,productline			
            ,size							
            ,weight
            ,_sdc_batched_at			
            ,_sdc_extracted_at as last_etl_run           			
            ,_sdc_received_at			
            ,_sdc_sequence
            ,_sdc_table_version	                   
        from {{ source ('adventureworks', 'product')}}
    )
select * from source 
