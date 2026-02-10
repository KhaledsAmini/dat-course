{{
    config(
        materialized='table',
    )
}}

with fct_reviews as (
    select * from {{ ref('fct_reviews') }}
),
full_moon_dates as (
    select * from {{ ref('seed_full_moon_dates') }}
)
select 
r.LISTING_ID,
r.REVIEW_DATE,
r.REVIEWER_NAME,
r.REVIEW_TEXT,
r.REVIEW_SENTIMENT,
fmd.full_moon_date,
case
    when fmd.full_moon_date is not null then 'Full Moon Review'
    else 'Regular Review'
end as is_full_moon_review
from fct_reviews r
left join full_moon_dates fmd
on (to_date(r.review_date) = DATEADD(DAY, 1 ,fmd.full_moon_date))