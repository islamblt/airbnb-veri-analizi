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
- Power BI Desktop
- HTML / CSV (veri aktarımı için)

## 3. Veri Seti

Projede Kaggle üzerinden alınan New York City Airbnb Open Data veri seti kullanılmıştır.

- **Veri kaynağı:** [Kaggle - New York City Airbnb Open Data](https://www.kaggle.com/datasets/dgomonov/new-york-city-airbnb-open-data)
- **Dosya adı:** `AB_NYC_2019.csv`
- **Satır sayısı:** 48.895
- **Sütun sayısı:** 16
- **Veri yılı:** 2019

### Veri İnceleme ve Temizleme Çalışması

Projeye Python, Pandas ve NumPy kullanılarak hazırlanan `airbnb_veri_temizleme.ipynb` dosyası eklenmiştir.

Bu çalışmada:

- Veri setinin genel yapısı ve sütunları incelenmiştir.
- Eksik verilerin sayısı ve oranı kontrol edilmiştir.
- Yinelenen kayıtlar araştırılmıştır.
- Sıfır, negatif ve olağan dışı fiyat değerleri incelenmiştir.
- Minimum konaklama süreleri değerlendirilmiştir.
- Enlem ve boylam bilgilerinin geçerliliği kontrol edilmiştir.
- Oda türleri ve bölge bilgileri incelenmiştir.
- Yorum sayıları, yorum tarihleri ve müsaitlik bilgileri değerlendirilmiştir.
- Eksik ilan ve ev sahibi bilgileri kontrol edilmiştir.
- Tespit edilen veri kalitesi sorunlarına yönelik temizleme kararları değerlendirilmiştir.

**Veri incelemesi sonucunda elde edilen bulgular:**

| Kontrol | Sonuç |
|---|---:|
| Toplam kayıt | 48.895 |
| Toplam sütun | 16 |
| Eksik ilan adı | 16 |
| Eksik ev sahibi adı | 21 |
| Eksik son yorum tarihi | 10.052 |
| Eksik aylık yorum sayısı | 10.052 |
| Yinelenen kayıt | 0 |
| Sıfır fiyatlı ilan | 11 |
| 365 günden fazla minimum gece | 14 |
| Geçersiz koordinat | 0 |

İnceleme sonucunda eksik ve olağan dışı değerler değerlendirilmiş, kesin hata olduğu doğrulanamayan kayıtların gereksiz yere silinmemesine karar verilmiştir.

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

**mart_dashboard_listings**

- Her Airbnb ilanını ayrı bir satırda tutar.
- İlanların mahalle ve oda türü bilgilerini içerir.
- Gecelik fiyat ve minimum konaklama süresini gösterir.
- Yorum sayısı ve müsaitlik bilgilerini içerir.
- Power BI dashboard üzerinde KPI, grafik ve filtre oluşturulmasını destekler.

**mart_host_analysis**

- Ev sahiplerine göre toplam ilan sayılarını hesaplar.
- Ev sahiplerinin ilanlarının ortalama, minimum ve maksimum fiyatlarını gösterir.
- Ev sahiplerinin toplam yorum sayılarını hesaplar.
- Ortalama müsaitlik günlerini analiz eder.

**mart_availability_analysis**

- Bölge ve oda türüne göre ilan sayılarını hesaplar.
- Ortalama müsait günleri gösterir.
- Minimum ve maksimum müsaitlik günlerini karşılaştırır.
- Yıllık müsaitlik oranını hesaplar.

**mart_neighborhood_room_type_analysis**

- Mahalle ve oda türüne göre ilan sayılarını hesaplar.
- Ortalama ve medyan fiyatları karşılaştırır.
- Ortalama minimum konaklama süresini gösterir.
- Toplam yorum sayılarını ve ortalama müsaitlik günlerini analiz eder.

## 5. Veri Testleri

Verilerin doğruluğunu ve tutarlılığını kontrol etmek amacıyla dbt testleri oluşturulmuş ve başarıyla çalıştırılmıştır.

Uygulanan testler:

- İlan numaralarının benzersiz olması (`unique`).
- İlan numaralarının boş olmaması (`not_null`).
- Mahalle bilgilerinin boş olmaması (`not_null`).
- Fiyat bilgilerinin boş olmaması (`not_null`).
- Enlem bilgilerinin boş olmaması (`not_null`).
- Boylam bilgilerinin boş olmaması (`not_null`).
- Oda türlerinin boş olmaması (`not_null`).
- Oda türlerinin belirlenen değerlerden oluşması (`accepted_values`).
- Minimum konaklama süresinin boş olmaması (`not_null`).
- Enlem ve boylam değerlerinin geçerli koordinat aralıklarında olması.

**Test sonucu:** 10 başarılı test, 0 hata.

## 6. dbt Dokümantasyonu

- Modeller için açıklamalar eklenmiştir.
- dbt Docs oluşturulmuştur.
- Modeller ve veri akışı dokümantasyon üzerinden görüntülenmiştir.

## 7. Proje Kontrolü

`dbt build` komutu ile modeller ve testler başarıyla çalıştırılmıştır.

Sonuç:

| Durum | Sayı |
|---|---:|
| PASS | 17 |
| WARN | 0 |
| ERROR | 0 |
| SKIP | 0 |
| TOTAL | 17 |

**Güncel Model Sayısı:** 7
- 1 Staging modeli
- 6 Mart modeli

**Veri Testleri:** 10 başarılı, 0 hata.

## 8. GitHub

- GitHub üzerinde özel bir proje deposu oluşturulmuştur.
- Proje dosyaları ve CSV veri seti depoya yüklenmiştir.
- Dört takım arkadaşına depo erişimi verilmiştir.
- Power BI dashboard dosyası ve dashboard için hazırlanan CSV dosyaları depoya yüklenmiştir.

## 9. Power BI Dashboard

Proje kapsamında, dbt ile hazırlanan mart modelleri kullanılarak Power BI Desktop üzerinde etkileşimli bir dashboard oluşturulmuştur.

Dashboard İçeriği
- Toplam Airbnb ilan sayısı KPI göstergesi.
- Ortalama gecelik fiyat KPI göstergesi.
- Ortalama minimum konaklama süresi KPI göstergesi.
- Bölgeye göre en yüksek fiyat KPI göstergesi.
- Oda türüne göre ortalama fiyat KPI göstergesi.
- Oda türüne göre ilan sayısı KPI göstergesi.
- Mahalle gruplarına göre filtreleme (neighbourhood_group).
- Oda türlerine göre filtreleme (room_type).

### Dashboard Grafikleri

1. Mahallelere Göre Ortalama Airbnb Fiyatları

New York mahallelerindeki Airbnb ilanlarının ortalama gecelik fiyatlarını karşılaştırır. Grafik, mahalleler arasındaki fiyat farklılıklarının incelenmesini sağlar.

2. Oda Türlerine Göre Ortalama Airbnb Fiyatları

Entire home/apt, Private room ve Shared room kategorilerindeki ortalama gecelik fiyatları karşılaştırır.

3. Bölgelere Göre Airbnb İlan Dağılımı

Bronx, Brooklyn, Manhattan, Queens ve Staten Island bölgelerindeki Airbnb ilanlarının dağılımını gösterir.

### Kullanılan Veri Dosyaları

Power BI raporunda kullanılmak üzere dbt mart modellerinden CSV dosyaları oluşturulmuştur.

- `mart_dashboard_listings.csv`
- `mart_neighborhood_prices.csv`
- `mart_room_type_analysis.csv`
- `mart_host_analysis.csv`
- `mart_availability_analysis.csv`
- `mart_neighborhood_room_type_analysis.csv`

### Dashboard Dosyası

- `Airbnb_Veri_Analizi.pbix`

Power BI raporu ve ilgili üç CSV dosyası GitHub deposuna yüklenmiştir.
