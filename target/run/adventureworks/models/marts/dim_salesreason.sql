

  create or replace table `adventureworks-314121`.`dbt_arthur`.`dim_salesreason`
  
  
  OPTIONS()
  as (
    with 
    sourcesalesreason as (
        select 
         salesreasonid 
         ,salereason
        from `adventureworks-314121`.`dbt_arthur`.`stg_salesreason`
    )
    , salesorderheadersalesreason as (
        select distinct
            salesorderid
            ,salesreasonid
    
        from `adventureworks-314121`.`dbt_arthur`.`stg_salesorderheadersalesreason` 
    )   
    , selected as (
        select distinct	
            salesorderheadersalesreason.salesorderid
            ,sourcesalesreason.salereason			
            ,sourcesalesreason.salesreasonid
        from salesorderheadersalesreason
        left join sourcesalesreason on salesorderheadersalesreason.salesreasonid =  sourcesalesreason.salesreasonid
    )
    , transformedsalesreason as (
        select distinct
        row_number() over(order by salesreasonid) as salesreason_sk
        , * 
        from selected
    )
select distinct * from transformedsalesreason
where salereason = 'Quality' or salereason = 'On Promotion'
  );
    