Feature: As an administrator (admin) I should be able to access the Expense Head lists via API connection.
  @UGUR
    @US24
  Scenario Outline: When a GET request is sent to the api/getExpenseHead endpoint with valid authorization
  information, it should be verified that the status code returned is 200 and the message information in the
  response body is “Success”.

    * The api user sets "api/getExpenseHead" path parameters.
    # Api kullanicisi "api/getExpenseHead" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
    * The api user verifies the information in the response body for the entry with the specified "<id>" index, including "<exp_category>", "<description>", "<is_active>", "<is_deleted>" and "<created_at>".
    # Api kullanıcısı response body icindeki <id> indexe sahip olanin "<exp_category>", "<description>", "<is_active>", "<is_deleted>" ve "<created_at>" bilgilerini doğrular.

    Examples:
      | id  | exp_category  | description        | is_active     | is_deleted   | created_at           |
      | 0 | Building rent   |                   | yes           | no           | 2021-10-25 13:50:41   |


  Scenario: Invalid Token When a GET request is sent to the /api/getExpenseHead endpoint with invalid authorization
  information, it should be verified that the status code returned is 403 and the message in the response body is
  "You do not have authorization or token error.".

    * The api user sets "api/getExpenseHead" path parameters.
    # Api kullanicisi "api/getExpenseHead" path parametrelerini olusturur
    * The api user sends a GET request, saves the returned response, and verifies that the status code is 403 with the "message" phrase "You do not have authorization or token error"
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '403' ve reason phrase bilgisinin Forbidden oldugunu dogrular
