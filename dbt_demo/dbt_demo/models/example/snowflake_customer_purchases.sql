
{{ config(materialized='view') }}

with total_order_price as (

select 
      cust.c_custkey
    , cust.c_name
    , cust.c_nationkey
    , sum(ord.o_totalprice) as total_order_price
from snowflake_sample_data.tpch_sf1.customer as cust 
    left outer join 
        snowflake_sample_data.tpch_sf1.orders as ord 
        on cust.c_custkey = ord.o_custkey
group by 
       cust.c_custkey
    ,  cust.c_name
    ,  cust.c_nationkey 

) 

select * 
from total_order_price