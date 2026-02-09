{{
    config(materialized='view')
}}

with src_host as (
    select * from {{ ref('src_host') }}
)

select
    host_id,
    nvl(host_name, 'Anonymous') as host_name,
    is_superhost
from src_host