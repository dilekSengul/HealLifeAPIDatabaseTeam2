Feature: As an administrator (admin), I should be able to access the expense head information of the user
  whose id is given through the API connection.
@ONUR
  @US25
  Scenario Outline: When sending a GET body with valid authorization information and correct data (id) to the
  /api/getExpenseHeadById endpoint, it should be verified that the status code returned is 200 and the message
  information in the response body is “Success”.

    * The api user sets "api/getExpenseHeadById" path parameters.
    # Api kullanicisi "api/getExpenseHeadById" path parametrelerini olusturur
    * The api user prepares a GET request containing the <id> information to send to the api getExpenseHeadById endpoint.
    # Api kullanicisi api getExpenseHeadById endpointine gondermek icin <id> bilgisini iceren bir get request hazirlar
    * The api user sends a GET body and saves the returned response.
    # Api kullanicisi GET body gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
    * The api user verifies that the data in the response body includes "<id>", "<exp_category>", "<description>", "<is_active>", "<is_deleted>" and "<created_at>".
    # Api kullanicisi response bodydeki data "<id>", "<exp_category>", "<description>", <is_active>, <is_deleted> ve "<created_at>" içeriklerini doğrular.

    Examples:
      | id  | exp_category  | description      | is_active     | is_deleted   | created_at           |
      | 583 | test category | test description     | null          | null         | 2024-12-04 02:34:42  |


  Scenario Outline: When a GET body containing valid authorization information and invalid data (id) is sent to the
  /api/getExpenseHeadById endpoint, the status code returned is 203 and the message information in the response body
  is "No id or wrong id." It should be verified that it is.

    * The api user sets "api/getExpenseHeadById" path parameters.
    # Api kullanicisi "api/getExpenseHeadById" path parametrelerini olusturur
    * The api user prepares a GET request containing the <id> information to send to the api getExpenseHeadById endpoint.
    # Api kullanicisi api getExpenseHeadById endpointine gondermek icin <id> bilgisini iceren bir get request hazirlar
    * The api user sends a GET body and saves the returned response.
    # Api kullanicisi GET body gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No id or wrong id.".
    # Api kullanicisi response bodydeki message bilgisinin "No id or wrong id." oldugunu dogrular

    Examples:
      | id      |
      | 284669  |


  Scenario: When a DELETE body containing valid authorization information and invalid data (id) is sent to the
  /api/getExpenseHeadById endpoint, the status code returned is 203 and the message information in the response body is
  "No id or wrong id." It should be verified that it is.

    * The api user sets "api/getExpenseHeadById" path parameters.
    # Api kullanicisi "api/getExpenseHeadById" path parametrelerini olusturur
    * The api user prepares a GET request that does not contain data
    # Api kullanicisi data icermeyen bir get request hazırlar
    * The api user sends a GET body and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No id or wrong id.".
    # Api kullanicisi response bodydeki message bilgisinin "No id or wrong id." oldugunu dogrular


  Scenario Outline: Invalid Token When sending a GET body with invalid authorization information to the api/getExpenseHeadById
  endpoint, it should be verified that the status code returned is 403 and the message in the response body is
  "You do not have authorization or token error".

    * The api user sets "api/getExpenseHeadById" path parameters.
    # Api kullanicisi "api/getExpenseHeadById" path parametrelerini olusturur
    * The api user prepares a GET request containing the <id> information to send to the api getExpenseHeadById endpoint.
    # Api kullanicisi api getExpenseHeadById endpointine gondermek icin <id> bilgisini iceren bir get request hazirlar
    * The api user sends a GET request, saves the returned response, and verifies that the status code is 403 with the "message" phrase "You do not have authorization or token error"
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '403' ve reason phrase bilgisinin Forbidden oldugunu dogrular

    Examples:
      | id |
      | 28 |
