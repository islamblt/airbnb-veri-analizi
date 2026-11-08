{{ config(materialized='table') }}

/*
Mahalle ve oda türüne göre Airbnb ilanlarını analiz eder.
İlan sayılarını, fiyatları ve yorumları karşılaştırır.
*/

select
    neighbourhood_group,
    neighbourhood,
    room_type,

    count(*) as total_listings,

    round(avg(price), 2) as average_price,
    median(price) as median_price,

    round(avg(minimum_nights), 2) as average_minimum_nights,

    sum(number_of_reviews) as total_reviews,

    round(avg(availability_365), 2) as average_available_days

from {{ ref('stg_airbnb_listings') }}

where price > 0

group by
    neighbourhood_group,
    neighbourhood,
    room_type