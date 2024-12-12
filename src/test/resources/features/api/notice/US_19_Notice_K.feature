@smoke
Feature: As an administrator (admin), I should be able to access announcements via API connection.
        # Bir yönetici (admin) olarak API baglantisi üzerinden duyurulara erisebilmeliyim.

  Scenario Outline:  When a GET request is sent to the /api/getNotice endpoint with valid authorization information, it should be verified that the status code returned is 200 and the message information in the response body is “Success”.
                    #/api/getNotice endpoint'ine gecerli authorization bilgileri ile bir
                    #GET request gönderildiginde dönen status code'un 200 oldugu ve response body'deki message bilgisinin "Success" oldugu dogrulanmali.

    Given The api user sets "api/getNotice" path parameters.
         # Api kullanicisi "api/getNotice" path parametrelerini olusturur

    When The api user sends a GET request and saves the returned response.
        # Api kullanicisi GET request gonderir ve donen responsei kaydeder

    Then The api user verifies that the status code is 200.
       #  Api kullanicisi status codeun 200 oldugunu dogrular

    Then The api user verifies that the "message" information in the response body is "Success".
      # Api kullanicisi response bodydeki "message" bilgisinin "Success" oldugunu dogrular

    Then  The api user verifies the information in the response body for the entry with the specified <dataindex> index, including "<type>" ve "<slug>","<url>","<title>" and "<date>".
     # Api kullanıcısı response body icindeki  <dataindex> index'e sahip olanin  "<type>" ve "<slug>","<url>","<title>","<date>" bilgilerini doğrular

    Examples:
      |   dataindex  | type   | slug         |url   |title          |date      |
      | 0            | notice |noticehospital|      |notice hospital|2024-12-12|



  Scenario: Invalid Token When a GET request is sent to the /api/getNotice endpoint with invalid authorization information, it should be verified that the status code returned is 403 and the message in the response body is "You do not have authorization or token error.".
          # Invalid Token /api/getNotice endpoint'ine gecersiz authorization bilgileri ile bir GET request gönderildiginde dönen status code'un 403 oldugu
          # ve response body'deki message bilgisinin "You do not have authorization or token error." oldugu dogrulanmali.

    Given The api user sets "api/getNotice" path parameters.
      #  Api kullanicisi "api/getNotice" path parametrelerini olusturur
    Then The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
     # Api kullanicisi GET request gonderir, donen responsei kaydeder, status code'un '403' ve reason phrase bilgisinin Forbidden oldugunu dogrular



