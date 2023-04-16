
{{config(materialized='table')}}



with src_orders as (

     select * 
     from {{ source('sample','orders') }}

),

total_price as (

    select ord.o_orderdate 
         , sum(ord.o_totalprice) as daily_totals
    from src_orders as ord
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

--. using this method to run the filter locally instead of warehouse 
{% if target.name == 'dev'  %}
where year(o_orderdate) = 1996
{% endif %}
 


