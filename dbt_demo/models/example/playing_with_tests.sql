
{{ config(materialized='table') }}


with src_customer as (

    select * 
    from {{ source('sample', 'customer')  }}

)

select c_custkey
    ,  c_mktsegment
    ,  {{rename_segments('c_mktsegment')}} as c_mktsegment_adjusted
from src_customer

