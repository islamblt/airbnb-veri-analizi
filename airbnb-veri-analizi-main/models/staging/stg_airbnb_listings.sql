
{{ config(materialized='view') }}

/*
Bu model ham Airbnb CSV verilerini okur ve temizler.
Sütunların veri türlerini düzenler, gereksiz boşlukları temizler
ve analiz için kullanılabilecek standart bir veri yapısı oluşturur.
*/

select
    cast(id as bigint) as listing_id,
    nullif(trim(name), '') as listing_name,
    cast(host_id as bigint) as host_id,
    nullif(trim(host_name), '') as host_name,
    trim(neighbourhood_group) as neighbourhood_group,
    trim(neighbourhood) as neighbourhood,
    cast(latitude as double) as latitude,
    cast(longitude as double) as longitude,
    trim(room_type) as room_type,
    cast(price as decimal(10,2)) as price,
    cast(minimum_nights as integer) as minimum_nights,
    cast(number_of_reviews as integer) as number_of_reviews,
    try_cast(last_review as date) as last_review,
    try_cast(reviews_per_month as double) as reviews_per_month,
    cast(calculated_host_listings_count as integer)
        as calculated_host_listings_count,
    cast(availability_365 as integer) as availability_365

from read_csv_auto('data/AB_NYC_2019.csv', header = true)
