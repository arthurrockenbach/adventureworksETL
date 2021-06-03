

  create or replace view `adventureworks-314121`.`dbt_arthur`.`stg_salesreason`
  OPTIONS()
  as with 
    source as (
        select distinct 
         salesreasonid			
         ,name as salereason
         ,reasontype			
         ,modifieddate			
         ,_sdc_batched_at			
         ,_sdc_extracted_at as last_etl_run           			
         ,_sdc_received_at			
         ,_sdc_sequence
         ,_sdc_table_version			
         from `adventureworks-314121`.`adventureworks`.`salesreason`
    )
select * from source;

