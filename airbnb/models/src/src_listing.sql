with raw_listing as (
    select * from {{ source('airbnb', 'listings') }}
)

select id as id_listing,
listing_url,
name,
room_type,  
minimum_nights,
host_id,
price as price_str
from raw_listing



