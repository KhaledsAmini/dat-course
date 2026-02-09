with l as
(select * from {{ ref('dim_listings_cleansed') }}),
h as
(select * from {{ ref('dim_host_cleansed') }})
select
    l.id_listing,
    l.name as listing_name,
    l.room_type,    
    l.minimum_nights,
    l.price,
    h.host_id,
    h.host_name,
    h.is_superhost as host_is_superhost
from l
left join h
on l.host_id = h.host_id
