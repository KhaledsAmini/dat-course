{{ 
    config(materialized='view') 
}}
WITH SRC_LISTING AS (
    SELECT * FROM {{ ref('src_listing') }}
)
select 
    id_listing,
    listing_url,
    name,
    room_type,  
    case 
        when minimum_nights = 0 then null
        else minimum_nights
    end as minimum_nights,
    host_id,
   replace(price_str, '$', '')::number(10,2) as price,
from SRC_LISTING