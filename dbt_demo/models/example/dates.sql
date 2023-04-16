
-- demonstrates an incremental load
{{ config(materialized='incremental') }}


with src_dates as (

    select * 
    from {{ source('sf10', 'date_dim') }}

)

select *
from src_dates
where d_date <= current_date


--. used to apply the incremental load
{% if is_incremental() %}
    and d_date > (select max(d_date) from {{ this }})
{% endif %}