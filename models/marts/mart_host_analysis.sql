
{{ config(materialized='table') }}

/*
Ev sahiplerinin ilan sayılarını, fiyatlarını,
yorumlarını ve müsaitlik durumlarını analiz eder.
*/

select
    host_id,
    host_name,
    count(*) as total_listings,
    round(avg(price), 2) as average_price,
    min(price) as minimum_price,
    max(price) as maximum_price,
    sum(number_of_reviews) as total_reviews,
    round(avg(availability_365), 2) as average_availability,
    max(calculated_host_listings_count) as host_listings_count

from {{ ref('stg_airbnb_listings') }}

where price > 0

group by
    host_id,
    host_name
