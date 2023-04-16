
/**********************************************************************************************************************************************************************
demonstrates an incremental load. after 11:59 pm, this table will no longer load data. 
alos demonstrates the "unique key" tests within the dataset configuration. however, as best practice, the same contraint is being applied during source initialization 
see dbt_demo/schema.yml @line 87 
***********************************************************************************************************************************************************************/
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




