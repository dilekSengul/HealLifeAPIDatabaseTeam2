Feature: As an administrator (admin) I should be able to access the Visitor List via API connection.
         # Bir yönetici (admin) olarak API baglantisi üzerinden Visitor List'e erisebilmeliyim.

  Scenario Outline: When a GET request is sent to the /api/visitorsList endpoint
                    with valid authorization information, it should be verified that
                    the status code returned is 200 and the message information in the response body is “Success”
                    and the information (source, purpose, name, email, contact, id_proof, visit_to, ipd_opd_staff_id,
                    related_to, no_of_pepple, date, in_time, out_time, note, image, created_at)
                    returned in the response body of id(x) should be verified.
                    # /api/visitorsList endpoint'ine gecerli authorization bilgileri ile
                    # bir GET request gönderildiginde dönen status code'un
                    # 200 oldugu ve response body'deki message bilgisinin "Success" oldugu ve
                    # id(x) olaninin response body'de donen bilgileri (source, purpose,
                    # name, email, contact, id_proof, visit_to, ipd_opd_staff_id,
                    # related_to, no_of_pepple, date, in_time, out_time, note, image,
                    # created_at) dogrulanmali.


    * The api user sets "api/visitorsList" path parameters.
    # Api kullanicisi "api/visitorsList" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
    * The api user verifies the information in the response body for the entry with the specified <id> index, including "<source>", "<purpose>", "<name>", "<email>", "<contact>", "<id_proof>", "<visit_to>", "<ipd_opd_staff_id>", "<related_to>", "<no_of_pepple>", "<date>", "<in_time>", "<out_time>", "<note>", "<image>", "<created_at>".
    # Api kullanıcısı response body icindeki <dataIndex> indexe sahip olanin bilgilerini doğrular.

    Examples:
      |id|1153|
      |source|       |
      |purpose|Inquiry|
      |name|Bayram  son eklenen 1|
      |email|deneme@deneme.com   |
      |contact|9638521770        |
      |id_proof|0125856          |
      |visit_to|opd_patient      |
      |ipd_opd_staff_id|2        |
      |related_to|bayram ERGUVEN (4) (OPDN2)|
      |no_of_pepple|1                       |
      |date|2023-10-05                      |
      |in_time|09:30 PM                     |
      |out_time|10:30 PM                    |
      |note|                                |
      |image|                               |
      |created_at|2024-12-05 09:39:05       |
