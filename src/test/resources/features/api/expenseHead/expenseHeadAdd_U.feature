Feature: As an administrator (admin) I want to be able to create a new expense head record via API connection.
  @UGUR
    @US26
  Scenario Outline: A POST request to the "api/addExpenseHead" endpoint with valid authorization and correct data
  should return a 200 status code, a response body with the message "Success," and the creation of the new expense
  head record should be verified via a GET request to the "api/getExpenseHeadById" endpoint using the "addId"
  from the response body.

    * The api user sets "api/addExpenseHead" path parameters.
    # Api kullanicisi "api/addExpenseHead" path parametrelerini olusturur
    * The api user prepares a POST request containing "<exp_category>" and "<description>" information to send to the api addExpenseHead endpoint.
    # Api kullanicisi api addExpenseHead endpointine gondermek icin "<exp_category>" ve "<description>" bilgilerini iceren bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular

    Examples:
      | exp_category      | description        |
      | test category     | test description   |


  Scenario: When a POST request that does not contain valid data is sent to the
  api/addExpenseHead endpoint, the status code returned is 203 and the message information in the response
  body is "No information or missing information. Please check your input data." It should be verified that it is.

    * The api user sets "api/addExpenseHead" path parameters.
    # Api kullanicisi "api/addExpenseHead" path parametrelerini olusturur
    * The api user prepares a POST request that does not contain data
    # Api kullanicisi data icermeyen bir post request hazırlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No information or missing information. Please check your input data.".
    # Api kullanicisi response bodydeki message bilgisinin "No information or missing information. Please check your input data." oldugunu dogrular

  Scenario Outline: Invalid Token api/addExpenseHead endpoint'ine gecersiz authorization bilgileri ile dogru datalar
  (exp_category, description) iceren bir POST body gönderildiginde dönen status code'in 403 oldugu ve
  response body'deki message bilgisinin "You do not have authorization or token error" oldugu dogrulanmali.

    * The api user sets "api/addExpenseHead" path parameters.
    # Api kullanicisi "api/addExpenseHead" path parametrelerini olusturur
    * The api user prepares a POST request containing "<exp_category>" and "<description>" information to send to the api addExpenseHead endpoint.
    # Api kullanicisi api addExpenseHead endpointine gondermek icin "<exp_category>" ve "<description>" bilgilerini iceren bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 403.
    # Api kullanicisi status codeun 403 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "You do not have authorization or token error".
    # Api kullanicisi response bodydeki message bilgisinin "You do not have authorization or token error" oldugunu dogrular

    Examples:
      | exp_category    | description      |
      | test category   | test description |


  Scenario Outline: The creation of the new expense head record to be created via the API must be verified via the API.

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

    Examples:
      | id  |
      | 583 |


