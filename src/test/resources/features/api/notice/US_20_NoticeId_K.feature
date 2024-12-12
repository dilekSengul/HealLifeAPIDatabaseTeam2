@smoke
Feature:As an administrator (admin), I should be able to access the relevant announcement data by entering id through the API connection.


  Scenario Outline: When a GET body with valid authorization information and correct data (id) is sent to the /api/getNoticeById endpoint,
                         it should be verified that the status code returned is 200 and the message information in the response body is “Success”
                         correct data (id) is sent to /api/getNoticeById endpoint, the data (id, type, slug, url, title, date) in the response body should be validated.
    Given The api user sets "api/getNoticeById" path parameters.
    When The api user prepares a GET request containing the <id> information to send to the api getNoticeById endpoint.
    Then The api user sends a GET body and saves the returned response.
    Then The api user verifies that the status code is 200.
    Then  The api user verifies that the "message" information in the response body is "Success".

    Then The API user verifies the contents of the response body, including "<id>", "<type>", "<slug>", "<url>", "<title>", and "<date>".

    Examples:
      | id  | id   |  type   | slug  |url   |title |date      |
      | 335 | 335  | notice  | Ein   | null |hallo |2023-06-02 |

  Scenario Outline: When a GET body containing valid authorization information and invalid data (id) is sent to the
  /api/getNoticeById endpoint, the status code returned is 203 and the message information in the response body
  is "No id or wrong id.Please check your id number." It should be verified that it is.
      #gecersiz data (id) iceren bir GET body gönderildiginde de dönen status code'in 203 oldugu ve
      # response body'deki message bilgisinin "No id or wrong id. Please check your id number." oldugu dogrulanmali.

    Given The api user sets "api/getNoticeById" path parameters.
    # Api kullanicisi "api/getNoticeById" path parametrelerini olusturur
    When The api user prepares a GET request containing the <id> information to send to the api getNoticeById endpoint.
    # Api kullanicisi api api/getNoticeById endpointine gondermek icin <id> bilgisini iceren bir get request hazirlar
    Then The api user sends a GET body and saves the returned response.
    # Api kullanicisi GET body gonderir ve donen responsei kaydeder
    Then The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    Then The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".
    # Api kullanicisi response bodydeki message bilgisinin "No id or wrong id.Please check your id number." oldugunu dogrular

    Examples:
      | id     |
      | 777    |

  Scenario: When a GET request that does not contain valid authorization information and data (id) is sent to the
  /api/getNoticeById endpoint, the status code returned is 203 and the message information in the response body is
  "No id or wrong id.Please check your id number." It should be verified that it is.

    Given The api user sets "api/getNoticeById" path parameters.
    # Api kullanicisi "api/getNoticeById" path parametrelerini olusturur
    When The api user prepares a GET request that does not contain data
    # Api kullanicisi data icermeyen bir get request hazırlar
    Then The api user sends a GET body and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    Then The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    Then The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".
    # Api kullanicisi response bodydeki message bilgisinin "No id or wrong id.Please check your id number." oldugunu dogrular


  Scenario Outline:Invalid Token When sending a GET body with invalid authorization information to the api/getExpenseHeadById
  endpoint, it should be verified that the status code returned is 403 and the message in the response body is
  "You do not have authorization or token error".

    Given The api user sets "api/getNoticeById" path parameters.
    # Api kullanicisi "api/visitorsPurposeId" path parametrelerini olusturur
    When The api user prepares a GET request containing the <id> information to send to the api getNoticeById endpoint.
    # Api kullanicisi api api/getNoticeById endpointine gondermek icin <id> bilgisini iceren bir get request hazirlar
    * The api user sends a GET body, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '403' ve reason phrase bilgisinin Forbidden oldugunu dogrular

    Examples:
      | id |
     | 341 |
