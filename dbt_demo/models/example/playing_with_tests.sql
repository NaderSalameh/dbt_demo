
{{ config(materialized='table') }}


with customers as (

    select * 
    from snowflake_sample_data.tpch_sf100.customer

)

select * 
from customers

