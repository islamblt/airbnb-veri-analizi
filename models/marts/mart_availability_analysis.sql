
{{ config(materialized='table') }}

/*
Bu model Airbnb ilanlarının müsaitlik durumunu analiz eder.
Bölge ve oda türüne göre müsait günleri ve ilan sayılarını hesaplar.
*/

select
    neighbourhood_group,
    room_type,
    count(*) as total_listings,
    round(avg(availability_365), 2) as average_available_days,
    min(availability_365) as minimum_available_days,
    max(availability_365) as maximum_available_days,
    round(
        avg(availability_365) / 365.0 * 100,
        2
    ) as availability_rate

from {{ ref('stg_airbnb_listings') }}

where price > 0

group by
    neighbourhood_group,
    room_type
