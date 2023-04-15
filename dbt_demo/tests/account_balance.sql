
select 1
from {{ ref('playing_with_tests') }}
having sum(c_acctbal) <  100000000


