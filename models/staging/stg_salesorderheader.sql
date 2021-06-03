with 
    source as (
        select 
            salesorderid  
            ,customerid				
            ,shipmethodid
            ,shiptoaddressid as addressid					
            ,billtoaddressid			
            ,salespersonid
            ,territoryid					
            ,currencyrateid	            
            ,status	
            ,totaldue
            ,orderdate			
            ,modifieddate			
            ,rowguid
            ,purchaseordernumber			
            ,taxamt						
            ,onlineorderflag														
            ,creditcardapprovalcode			
            ,subtotal			
            ,creditcardid						
            ,freight			
            ,duedate													
            ,_sdc_batched_at			
            ,_sdc_extracted_at as last_etl_run           			
            ,_sdc_received_at			
            ,_sdc_sequence
            ,_sdc_table_version			
        from {{ source('adventureworks', 'salesorderheader')}}
    )
select * from source 