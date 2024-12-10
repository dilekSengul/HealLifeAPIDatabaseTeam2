Feature: As an administrator (admin) I should be able to delete the Expense Head record in the system via API connection.
  @UGUR
    @US28
  Scenario Outline: A DELETE request to the "/api/deleteExpenseHead" endpoint with valid authorization
  and correct data (id) should return a 200 status code, a response body message of "Success," and the "DeletedId" in the
  response should match the "id" in the request body. The deletion should be confirmed by sending a GET request to the
  "/api/deleteExpenseHead" endpoint using the "DeletedId" from the response.

    Given The api user sets "api/deleteExpenseHead" path parameters.
    # Api kullanicisi "api/deleteExpenseHead" path parametrelerini olusturur
    When The api user prepares a DELETE request with id "<id>" to send to the api apideleteNotice add endpoint.
    # Api kullanıcısı api deleteExpenseHead endpointine gönderilmek üzere bir DELETE request hazırlar.
    Then The api user sends a DELETE request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    Then The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    Then The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
    And The api user verifies that the Deletedid information is the same as the id "<id>" information in the request body.
    # Api kullanıcısı DeletedId bilgisinin request body icindeki id bilgisi ile ayni oldugunu dogrular

    Examples:
      | id  |
      | 659 |



  Scenario Outline: When a DELETE body containing valid authorization information and invalid data (id) is sent to the
  "/api/deleteExpenseHead" endpoint, the status code returned is 203 and the message information in the response
  body is "No id or wrong id. Please check your id number." It should be verified that it is.

    Given The api user sets "api/deleteExpenseHead" path parameters.
    # Api kullanicisi "api/deleteExpenseHead" path parametrelerini olusturur
    When The api user prepares a DELETE request with id "<id>" to send to the api deleteExpenseHead add endpoint.
    # Api kullanıcısı api deleteExpenseHead endpointine gönderilmek üzere bir DELETE request hazırlar.
    Then The api user sends a DELETE request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    Then The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    Then The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".
    # Api kullanicisi response bodydeki message bilgisinin "No id or wrong id. Please check your id number." oldugunu dogrular

    Examples:
      | id  |
      | 74256 |



  Scenario: Invalid Token When a DELETE body is sent to the /api/deleteExpenseHead endpoint with invalid authorization information,
  it should be verified that the status code returned is 403 and the message in the response body is
  "You do not have authorization or token error".

    * The api user sets "api/deleteExpenseHead" path parameters.
    # Api kullanicisi "api/deleteExpenseHead" path parametrelerini olusturur
    * The api user prepares a DELETE request that does not contain data
    # Api kullanicisi data icermeyen bir delete request hazırlar
    * The api user sends a DELETE request, saves the returned response, and verifies that the status code is 403 with the response body is "You do not have authorization or token error".
    # Api kullanicisi DELETE request gonderir, donen responsei kaydeder, status codeun '403' ve message bilgisinin Forbidden oldugunu dogrular



  Scenario Outline: It must be verified via the API that the Expense Head record that is requested to be deleted via
  the API has been deleted.

    * The api user sets "api/getExpenseHeadById" path parameters.
    # Api kullanicisi "api/getExpenseHeadById" path parametrelerini olusturur
    * The api user prepares a GET request containing the <id> information to send to the api getExpenseHeadById endpoint.
    # Api kullanicisi api getExpenseHeadById endpointine gondermek icin <id> bilgisini iceren bir get request hazirlar
    * The api user sends a GET body and saves the returned response.
    # Api kullanicisi GET body gonderir ve donen responsei kaydeder
    * The api user verifies that the "message" information in the response body is "No id or wrong id.".
    # Api kullanicisi response bodydeki message bilgisinin "No id or wrong id." oldugunu dogrular

    Examples:
      | id  |
      | 7528 |

