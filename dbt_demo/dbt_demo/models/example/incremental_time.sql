
-- this is for testing purposed only. after 11:59 pm, this table will no longer long data. 

{{ config(materialized='incremental', unique_key = 't_time') }}


select *
from snowflake_sample_data.tpcds_sf10tcl.time_dim
where to_time(concat(t_hour::varchar, ':', t_minute, ':', t_second)) <= current_time


{% if is_incremental() %}
    and t_time > (select max(t_time) from {{ this }})
{% endif %}





