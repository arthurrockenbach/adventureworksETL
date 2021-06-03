

  create or replace table `adventureworks-314121`.`dbt_arthur`.`dim_localization`
  
  
  OPTIONS()
  as (
    with 
    sourcesalesterritory as (
            select *
              ,name as countryname
            from `adventureworks-314121`.`dbt_arthur`.`stg_salesterritory`       
    )   
    ,sourceaddress as (
            select 
             postalcode
             ,stateprovinceid
             ,addressid			
             ,city	
            from `adventureworks-314121`.`dbt_arthur`.`stg_address` 
    ) 
    , sourcestateprovince as (
            select 
                stateprovinceid
                ,countryregionid
                ,territoryid
                ,statename 	
            from `adventureworks-314121`.`dbt_arthur`.`stg_stateprovince`		
    )
    , selected as (
            select 
              sourceaddress.addressid
              ,sourcestateprovince.statename
              ,sourcesalesterritory.countryname
              ,sourceaddress.city
              ,sourceaddress.postalcode
            from sourceaddress
            left join sourcestateprovince on sourceaddress.stateprovinceid = sourcestateprovince.stateprovinceid 
            left join sourcesalesterritory on sourcestateprovince.territoryid =  sourcesalesterritory.territoryid 
    )
    , transformed as (
            select 
              row_number() over (order by addressid) as address_sk,
              * 
            from selected
    )

select distinct * from transformed
  );
    