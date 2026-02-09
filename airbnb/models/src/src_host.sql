with raw_hosts as (
    select * from AIRBNB.RAW.raw_hosts
)
select 
    id as host_id,
    name as host_name,
    is_superhost
from raw_hosts