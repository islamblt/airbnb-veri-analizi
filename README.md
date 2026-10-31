# New York Airbnb Veri Analizi

## 1. Proje Hakkında

Bu proje, New York City Airbnb ilanlarının fiyatlarını ve özelliklerini analiz etmek amacıyla hazırlanmıştır.

Projenin amacı, Airbnb ilan fiyatlarının mahallelere ve oda türlerine göre nasıl değiştiğini incelemektir.

## 2. Kullanılan Teknolojiler

- Python
- DuckDB
- dbt Core
- dbt-duckdb
- Git
- GitHub

## 3. Veri Seti

Projede Kaggle üzerinden alınan New York City Airbnb Open Data veri seti kullanılmıştır.

- **Veri kaynağı:** [Kaggle - New York City Airbnb Open Data](https://www.kaggle.com/datasets/dgomonov/new-york-city-airbnb-open-data)
- **Dosya adı:** `AB_NYC_2019.csv`
- **Satır sayısı:** 48.895
- **Sütun sayısı:** 16
- **Veri yılı:** 2019

## 4. Veri İşleme ve Dönüştürme

Verilerin temizlenmesi ve analiz için hazırlanması amacıyla dbt kullanılmıştır.

### Staging Model

**stg_airbnb_listings**

- Ham CSV verisini okur.
- Sütunların veri tiplerini düzenler.
- Metin alanlarındaki gereksiz boşlukları temizler.
- Boş metinleri NULL değerine dönüştürür.
- Tarih ve sayısal alanları uygun veri tiplerine dönüştürür.

### Mart Modelleri

**mart_neighborhood_prices**

- Mahallelere göre toplam ilan sayısını hesaplar.
- Ortalama gecelik fiyatı hesaplar.
- Minimum ve maksimum fiyatları gösterir.

**mart_room_type_analysis**

- Oda türlerine göre toplam ilan sayısını hesaplar.
- Ortalama gecelik fiyatı karşılaştırır.
- Ortalama minimum konaklama süresini hesaplar.
- Ortalama müsaitlik günlerini hesaplar.
- Toplam yorum sayılarını gösterir.

## 5. Veri Testleri

dbt kullanılarak aşağıdaki testler oluşturulmuş ve başarıyla çalıştırılmıştır:

- İlan numaralarının benzersiz olması (`unique`).
- İlan numaralarının boş olmaması (`not_null`).
- Mahalle bilgilerinin boş olmaması (`not_null`).
- Fiyat bilgilerinin boş olmaması (`not_null`).

**Test sonucu:** 4 başarılı test.

## 6. dbt Dokümantasyonu

- Modeller için açıklamalar eklenmiştir.
- dbt Docs oluşturulmuştur.
- Modeller ve veri akışı dokümantasyon üzerinden görüntülenmiştir.

## 7. Proje Kontrolü

`dbt build` komutu ile modeller ve testler başarıyla çalıştırılmıştır.

Sonuç:

| Durum | Sayı |
|---|---:|
| PASS | 7 |
| WARN | 0 |
| ERROR | 0 |
| SKIP | 0 |
| TOTAL | 7 |

## 8. GitHub

- GitHub üzerinde özel bir proje deposu oluşturulmuştur.
- Proje dosyaları ve CSV veri seti depoya yüklenmiştir.
- Dört takım arkadaşına depo erişimi verilmiştir.