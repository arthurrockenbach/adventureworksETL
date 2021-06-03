with 
    sourceperson as (
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
        from {{ ref('stg_person')}}  
    )
    ,sourcebusinessentitycontact as (
        select 
            personid
            ,businessentityid			
            ,modifieddate			
            ,rowguid			
            ,contacttypeid
        from {{ ref('stg_businessentitycontact')}}
    )
    ,sourcecreditcard as (
        select 
            creditcardid
            ,cardtype	
            ,expyear	
            ,modifieddate	
            ,cardnumber	
            ,expmonth	

        from {{ ref('stg_creditcard')}} 
    ) 
    , sourcepersoncreditcard as (
        select 
            businessentityid
            ,creditcardid	 	 	
            ,modifieddate		 		

        from {{ ref('stg_personcreditcard')}} 
    )  
    , selected as (
        select 
         sourceperson.businessentityid,
         sourceperson.firstname,
         sourceperson.lastname, 
         sourcecreditcard.cardtype,
         sourcepersoncreditcard.creditcardid

        from sourceperson 
        left join sourcepersoncreditcard on sourceperson.businessentityid = sourcepersoncreditcard.businessentityid
        left join sourcecreditcard on sourcepersoncreditcard.creditcardid = sourcecreditcard.creditcardid
        
     )
    , transformed as (
        select 
           row_number() over (order by creditcardid) as creditcard_sk
           , *
        from selected
    )
select distinct * from transformed

   