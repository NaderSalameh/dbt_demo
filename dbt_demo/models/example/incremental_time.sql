
-- this is for testing purposed only. after 11:59 pm, this table will no longer long data. 

{{ config(materialized='incremental', unique_key = 't_time') }}


with src_time as (

    select * 
    from {{ source('sf10', 'time_dim') }}

)


select *
from src_time
where to_time(concat(t_hour::varchar, ':', t_minute, ':', t_second)) <= current_time


{% if is_incremental() %}
    and t_time > (select max(t_time) from {{ this }})
{% endif %}




