
select sum(iff(id is null, 1, 0)) / count(*)  as total_nulls
from {{ref('my_first_dbt_model')}}  
having sum(iff(id is null, 1, 0)) / count(*)  > .1

