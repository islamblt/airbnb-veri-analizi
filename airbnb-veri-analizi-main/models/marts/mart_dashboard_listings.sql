{{ config(materialized='table') }}

 /*
 Bu model Power BI dashboard'u için hazırlanmıştır.
 Her Airbnb ilanını ayrı bir satırda tutar.
 Mahalle, oda türü, fiyat ve diğer analiz alanlarını içerir.
 */

select
    listing_id,
    listing_name,
    host_id,
    host_name,
    neighbourhood_group,
    neighbourhood,
    room_type,
    price,
    minimum_nights,
    number_of_reviews,
    last_review,
    reviews_per_month,
    calculated_host_listings_count,
    availability_365

from {{ ref('stg_airbnb_listings') }}

where price > 0