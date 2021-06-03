

  create or replace view `adventureworks-314121`.`dbt_arthur`.`dim_location`
  OPTIONS()
  as with sourceaddress as (
           select 
             stateprovinceid			
             ,city	
            from `adventureworks-314121`.`dbt_arthur`.`stg_address` 
        ) 
        , sourcecountryregion as (
            select 
              countryregionid
              ,country
            from   `adventureworks-314121`.`dbt_arthur`.`stg_countryregion` 
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
              sourcestateprovince.territoryid
              ,sourceaddress.stateprovinceid
              ,sourcestateprovince.statename
              ,sourcestateprovince.countryregionid
              ,sourcecountryregion.country
              ,sourceaddress.city
            from sourceaddress
            left join sourcestateprovince on sourceaddress.stateprovinceid = sourcestateprovince.stateprovinceid 
            left join sourcecountryregion on sourcestateprovince.countryregionid = sourcecountryregion.countryregionid  
        )
        , transformed as (
            select
              row_number() over(order by territoryid) as territory_sk
              , * 
            from selected)
select * from transformed;

