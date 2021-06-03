with 
    source as (
        select 
         salesorderdetailid
         ,salesorderid
         ,specialofferid
         ,orderqty			
         ,unitprice			
		 ,modifieddate			
         ,rowguid			
         ,productid			
         ,carriertrackingnumber			
         ,unitpricediscount
         ,_sdc_batched_at	
         ,_sdc_extracted_at as last_etl_run
         ,_sdc_table_version
         ,_sdc_received_at	
         ,_sdc_sequence		
         from {{ source('adventureworks', 'salesorderdetail')}}
    )
    , source1 as (
        select 
         salesorderdetailid
         ,salesorderid
         ,specialofferid
         ,orderqty			
         ,unitprice					
         ,productid	
        from source
        )		
select * from source1