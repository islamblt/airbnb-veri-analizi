{{ config(materialized='table') }}

/*
Bu model Airbnb ilanlarını mahallelere göre gruplandırır.
Her mahalle için toplam ilan sayısını, ortalama gecelik fiyatı,
minimum fiyatı ve maksimum fiyatı hesaplar.
*/

select
    neighbourhood_group,
    neighbourhood,
    count(*) as total_listings,
    round(avg(price), 2) as average_price,
    min(price) as minimum_price,
    max(price) as maximum_price

from {{ ref('stg_airbnb_listings') }}

where price > 0

group by
    neighbourhood_group,
    neighbourhood