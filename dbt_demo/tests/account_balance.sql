
--. this test will fail. re wrote the reference view for another practice
select 1
from {{ ref('playing_with_tests') }}
having sum(c_acctbal) <  100000000


