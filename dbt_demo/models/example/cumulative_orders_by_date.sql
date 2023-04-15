
{{config(materialized='view')}}

with total_price as (

    select ord.o_orderdate 
         , sum(ord.o_totalprice) as daily_totals
    from snowflake_sample_data.tpch_sf1.orders as ord
    group by ord.o_orderdate

), 

cumulative as (

select ttl.o_orderdate 
     , ttl.daily_totals
     , sum(ttl.daily_totals) over(order by ttl.o_orderdate asc) as cumulative_order_total
from total_price as ttl
order by o_orderdate 

)

select *
from cumulative 
 

