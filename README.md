# Firma Veritabanı Tasarımı

Bu repo, **FirmaDB** adlı bir veritabanı oluşturur. Bu veritabanı, bir şirketin çalışanları, departmanları, projeleri, müşterileri gibi tabloları ve bu tablolar arasındaki ilişkileri ile birlike ilişkili oldukları bilgilerini içeren verileri depolar.

## 🚀 Proje Özeti

**FirmaDB** veritabanı, şirketin çalışanlarına ait bilgileri, projelerini, departmanlarını ve müşteri ilişkilerini modelleyen bir veritabanıdır. Şirketin farklı birimlerinin doğru bir şekilde ilişkilendirilmesi, verilerin tutarlı ve güvenli bir şekilde saklanması sağlanmıştır.

## 📋 İçerik

Bu repo, aşağıdaki başlıklarda veritabanı tasarımı ve ilgili bileşenleri içermektedir:

**Varlık ilişkşi diyagramı:** 

![alt text](<Entity-Relationship Diagram.png>)
Veritabanındaki ilgili tabloların aralarındaki ilişkisel yapı ve ilişki türü yukarıdaki diyagram içerisinde modellenmiştir. 

**Veritabanı tabloları:**

Database-Tables.xlsx isiml excel dosyasında veritabanında bulunan tablolar oluşturulup görselliği ve anlaşılabilirliği artırmak için örnek veriler ile popüle edilmiştir. Ayrıca ilişkisel yapılanmayı oluşturabilmek için kullanılan ek tablolara'da dosya içinde yer verilmiştir. Tabloların soldan ilk ve altı çizili sütunları birincil anahtar(primary key) alanını belirtirken tabloların turuncu renk ile işaretli sütunları yabancı anahtar(foreign key) alanını gösterir

**Veritabanı oluşturma scripti:** 

DatabaseScript.sql isimli dosya belirtilen veritabanını oluşturmak için yazılmıştır. İlgili script'te bulunan sql kodları sadece mysql veritabanında çalışmaktadır. 

## 📊 İlişkiler

- **Çalışanlar** tablosu, **Departmanlar** tablosu ile `DepartmanID` üzerinden ilişkilendirilmiştir ve ilgili tablolar arasında 1'e çok (1-N) türünde bir ilişki vardır.

- **Çalışanlar** tablosu, **Ofisler** tablosu ile `OfisID` üzerinden ilişkilendirilmiştir ve ilgili tablolar arasında 1'e çok (1-N) türünde bir ilişki vardır.

- **Çalışanlar** tablosu, **Projeler** tablosu ile `ProjeID` üzerinden ilişkilendirilmiştir ve ilgili tablolar arasında 1'e çok (1-N) türünde bir ilişki vardır.

- **Müşteriler** tablosu, **Siparişler** tablosu ile `MüşteriID` üzerinden ilişkilendirilmiştir ve ilgili tablolar arasında 1'e çok (1-N) türünde bir ilişki vardır.

- **Departmanlar** tablosu, **Müşteriler** tablosu ile `DepartmanID` ve `MüşteriID` üzerinden ilişkilendirilmiştir. İlgili tablolar arasında çoğa çok (N-N) türünde bir ilişki vardır. Bu ilişkinin sağlanbilmesi için Departman-Müşteri isimli ek bir tablo oluşturulmuştur.

- **Ürünler** tablosu, **Müşteriler** tablosu ile `ÜrünID` ve `MüşteriID` üzerinden ilişkilendirilmiştir. İlgili tablolar arasında çoğa çok (N-N) türünde bir ilişki vardır. Bu ilişkinin sağlanabilmesi için Müşteri-Ürün isimli ek bir tablo oluşturulmuştur.

## 🧑‍💻 Kullanım

Projeyi bilgisayarınıza klonlayın daha sonra ilgili script dosyasını `MySQLWorkbench` programı üzerinde çalıştırarak veritabanının oluşmasını sağlayın

Projeyi bilgisayarınıza klonlamak için aşağıdaki komutu kullanabilirsiniz:

```bash
git clone https://github.com/bahadirverir/CompanyDatabaseDesign 
