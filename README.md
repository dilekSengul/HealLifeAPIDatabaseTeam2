# 🌟 HealLife API & Database Testing Project  

Bu proje, **HealLife Hospital** web sitesinin backend QA testlerini gerçekleştirmek için oluşturulmuştur. Proje, **API** ve **database** olmak üzere iki ana bölümde incelenmiştir.  

---

## 🏆 Amaç  
Projenin amacı, HealLife Hospital platformunun güvenilir, hızlı ve doğru bir şekilde çalışmasını sağlamak için API'leri ve database operasyonlarını test etmektir. Test süreci, modern QA araçları ve teknolojileri kullanılarak gerçekleştirilmiştir.  

---

## 🛠️ Kullanılan Teknolojiler ve Araçlar  
- **JUnit**  
- **Cucumber**  
- **REST API**  
- **Rest Assured**  
- **JDBC**  
- **MySQL**  
- **Postman**  
- **Jenkins**  

---

## 🚀 Kurulum  
Projeyi çalıştırmak için aşağıdaki adımları izleyebilirsiniz:  
1. Repository'yi klonlayın:  
   `
   git clone https://github.com/dilekSengul/HealLifeAPIDatabaseTeam2.git
   `
2. İlgili IDE (IntelliJ IDEA veya Eclipse) ile projeyi açın.
3. Projenin bağımlılıklarını yöneten build tool'ları (Maven veya Gradle) kullanarak bağımlılıkları yükleyin.

## 🤝 Katkıda Bulunma
Projeye katkıda bulunmak için şu adımları izleyin:

1. Repository'yi fork edin.
2. Yeni bir branch oluşturun:

   `git checkout -b feature/your-feature-name`
4. Geliştirmelerinizi yapın ve commit edin:

    `git commit -m "Add feature: your feature name`
5. Branch'i repository'nize push edin:

  `git push origin feature/your-feature-name`
5. Pull Request (PR) oluşturun ve açıklama ekleyin.

## 📋 Özellikler ve API Dokümantasyonu

  ### API Testleri:  
  
  - Visitor Management (visitors,visitorsBook,visitorPurpose): Ziyaretçi kayıtları ve geliş amaçları.
  - Blood Group Operations(bloodGroup): Kan grubu bilgileri.
  - **Notice Management(notice): Duyuruların görüntülenmesi, eklenmesi, güncellenmesi ve silinmesi.  
  - Expense Categories(expenseHead): Harcama başlıklarının yönetimi ve ilgili işlemler.  
  - Findings and Categories(finding, findingCategory): Tıbbi bulguların ve kategorilerinin .  
  - **Staff and Patient Records**: Personel ve hasta listelerinin görüntülenmesi.  

  Her API uç noktası, aşağıdaki kriterlere göre test edilmiştir:  
  - Yanıt kodu doğrulama (200, 201, 400, 404 vb.)  
  - Yanıt sürelerinin ölçülmesi.  
  - Gönderilen ve alınan veri yapılarına uygunluk.  
  - CRUD işlemleri (Create, Read, Update, Delete) doğrulama.  

_Not: Test senaryoları için Postman koleksiyonu ileride paylaşılabilir._

  
  ### Database Testleri:
  
  - Hasta, doktor ve personel bilgilerinin doğru bir şekilde saklanması ve güncellenmesi.
  - Database sorgularının performans testi.
  - CRUD işlemlerinin (Create, Read, Update, Delete) doğrulaması.
    
_*Daha detaylı dokümantasyon ve kullanım örnekleri ilerleyen aşamalarda eklenecektir._

## 👥 Ekip Bilgisi
 Dilek Şengül(Team Lead)
 
 Damla Çinkaya(Scrum Master)
 
 Arzu Garryeva(QA Tester)
 
 Gülnar Jabrayilova(QA Tester)
 
 Hürrem Aksakal(QA Tester)
 
 İsmail Kaya(QA Tester)
 
 Kevser Çalışkan(QA Tester)
 
 Kübra Nur Çepik(QA Tester)
 
 Onur Vardal(QA Tester)
 
 Uğur Yaman(QA Tester)
 
 Serpil Sönmez(QA Tester)

## 📜 Lisans
Bu proje açık kaynaklıdır ve herhangi bir lisans altında yayınlanmıştır.
