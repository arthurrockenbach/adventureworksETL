

  create or replace view `adventureworks-314121`.`dbt_arthur`.`stg_customer`
  OPTIONS()
  as with 
    source as (
        select 
            customerid
            ,personid	
            ,modifieddate	
            ,rowguid		
            ,territoryid		
            ,storeid		
            ,_sdc_batched_at	
            ,_sdc_extracted_at as last_etl_run
            ,_sdc_table_version
            ,_sdc_received_at	
            ,_sdc_sequence	
        
        from `adventureworks-314121`.`adventureworks`.`customer`
    )
select * from source;

