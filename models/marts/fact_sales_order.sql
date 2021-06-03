with 
    salesreason as ( 
        select distinct * from  {{ref('dim_salesreason')}}
    )
    ,creditcard as (
        select  * from {{ref('dim_creditcard')}}
    )
    ,customers as (
        select  * from {{ ref('dim_customer') }}
    )
    , localization as (
        select  * from {{ ref('dim_localization') }}
    )
    , products as (
        select  * from {{ ref('dim_product') }}
    )
    , sales_orders_sk as (
          select 
            orderheader.salesorderid  
            ,customers.customer_sk as customer_fk		
            ,creditcard.creditcard_sk as creditcard_fk
            ,localization.address_sk as address_fk
            ,orderheader.status	
            ,orderheader.totaldue
            ,orderheader.orderdate						
          from {{ ref('stg_salesorderheader')}} as orderheader
          left join localization on orderheader.addressid = localization.addressid
          left join customers on orderheader.customerid = customers.customerid
          left join creditcard on orderheader.creditcardid = creditcard.creditcardid

    )
    , sales_orders_details_sk as (
        select 
         orderdetail.salesorderdetailid
         ,orderdetail.salesorderid
         ,products.product_sk as product_fk
         ,orderdetail.specialofferid
         ,orderdetail.orderqty			
         ,orderdetail.unitprice			
        from {{ref('stg_salesorderdetail')}} as orderdetail
        left join products on orderdetail.productid = products.productid
    )
    , final as (
        select distinct
            sales_orders_sk.salesorderid 
            ,sales_orders_sk.customer_fk
            ,sales_orders_sk.creditcard_fk
            ,sales_orders_details_sk.product_fk
            ,sales_orders_sk.address_fk
            ,sales_orders_sk.status	
            ,sales_orders_sk.orderdate						
            ,sales_orders_details_sk.orderqty			
            ,sales_orders_details_sk.unitprice
            ,salesreason.salesreason_sk as salesreason_fk
						
        from sales_orders_sk 
        left join sales_orders_details_sk on sales_orders_sk.salesorderid = sales_orders_details_sk.salesorderid
        left join salesreason on sales_orders_sk.salesorderid = salesreason.salesorderid		
    )

select  distinct * from final