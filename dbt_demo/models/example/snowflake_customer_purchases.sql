
{{ config(materialized='view') }}

with src_customers as (

    select * 
    from {{ source('sample', 'customer') }}

), 

scr_orders as (

    select * 
    from {{ source('sample', 'orders') }} 

)


select 
      cust.c_custkey
    , cust.c_name
    , cust.c_nationkey
    , sum(ord.o_totalprice) as total_order_price

from src_customers as cust 

    left outer join 
        scr_orders as ord 
        on cust.c_custkey = ord.o_custkey

{{group_by(3)}}


