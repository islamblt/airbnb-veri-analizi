{{ config(materialized='table') }}

/*
Bu model Airbnb ilanlarını oda türlerine göre gruplandırır.
Her oda türü için toplam ilan sayısını, ortalama fiyatı,
ortalama minimum konaklama süresini, ortalama müsaitlik gününü
ve toplam yorum sayısını hesaplar.
*/

select
    room_type,
    count(*) as total_listings,
    round(avg(price), 2) as average_price,
    round(avg(minimum_nights), 2) as average_minimum_nights,
    round(avg(availability_365), 2) as average_availability,
    sum(number_of_reviews) as total_reviews

from {{ ref('stg_airbnb_listings') }}

where price > 0

group by room_type