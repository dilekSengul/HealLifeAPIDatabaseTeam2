Feature: As an administrator (admin) I want to be able to create a new visitor record via API connection.

  Scenario Outline: A POST request to the "/api/visitorsAdd" endpoint with valid authorization and correct data
  should return a 200 status code, a response body with the message "Success," and the creation of the new visitor
  purpose record should be verified via a GET request to the "/api/visitorsPurposeId" endpoint using the "addId"
  from the response body.

    * The api user sets "api/visitorsAdd" path parameters.
    # Api kullanicisi "/api/visitorsAdd" path parametrelerini olusturur
    * The api user prepares a POST request containing "<purpose>", "<name>", "<email>", "<contact>", "<id_proof>", "<visit_to>", "<ipd_opd_staff_id>", "<related_to>", "<no_of_pepple>", "<date>", "<in_time>", "<out_time>" and "<note>" information to send to the api visitorsAdd endpoint.
    # Api kullanicisi api api/visitorsAdd endpointine gondermek icin "<visitors_purpose>" ve "<description>" bilgilerini iceren bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular

    Examples:
      | purpose | name                  | email           | contact   |id_proof|visit_to   |ipd_opd_staff_id|related_to                |no_of_pepple|date      |in_time |out_time|note|
      | Inquiry | Bayram  son eklenen 1 |deneme@deneme.com| 9638521770|0125856 |opd_patient|2               |bayram ERGUVEN (4) (OPDN2)|1           |2023-10-05|09:30 PM|10:30 PM|    |


  Scenario: When a POST request that does not contain valid authorization information and data is sent to the
            /api/visitorsAdd endpoint, the status code returned is 203 and the message information in the response
            body is "No information or missing information.
            Please check your input data." It should be verified that it is.

    * The api user sets "api/visitorsAdd" path parameters.
    # Api kullanicisi "/api/visitorsAdd" path parametrelerini olusturur
    * The api user prepares a POST request that does not contain data
    # Api kullanicisi data icermeyen bir post request hazırlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No information or missing information. Please check your input data.".
    # Api kullanicisi response bodydeki message bilgisinin "No information or missing information. Please check your input data." oldugunu dogrular


  Scenario Outline: Invalid Token /api/visitorsPurposeAdd endpoint'ine gecersiz authorization bilgileri ile dogru datalar
  (visitors_purpose, description) iceren bir  POST body gönderildiginde dönen status code'in 403 oldugu ve
  response body'deki message bilgisinin "You do not have authorization or token error" oldugu dogrulanmali.

    * The api user sets "api/visitorsAdd" path parameters.
    # Api kullanicisi "/api/visitorsAdd" path parametrelerini olusturur
    * The api user prepares a POST request containing "<purpose>", "<name>", "<email>", "<contact>", "<id_proof>", "<visit_to>", "<ipd_opd_staff_id>", "<related_to>", "<no_of_pepple>", "<date>", "<in_time>", "<out_time>" and "<note>" information to send to the api visitorsAdd endpoint.
    # Api kullanicisi api api/visitorsAdd endpointine gondermek icin "<visitors_purpose>" ve "<description>" bilgilerini iceren bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 403.
    # Api kullanicisi status codeun 403 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "You do not have authorization or token error".
    # Api kullanicisi response bodydeki message bilgisinin "You do not have authorization or token error" oldugunu dogrular

    Examples:
      | purpose | name                  | email           | contact   |id_proof|visit_to   |ipd_opd_staff_id|related_to                |no_of_pepple|date      |in_time |out_time|note|
      | Inquiry | Bayram  son eklenen 1 |deneme@deneme.com| 9638521770|0125856 |opd_patient|2               |bayram ERGUVEN (4) (OPDN2)|1           |2023-10-05|09:30 PM|10:30 PM|    |


  Scenario Outline: The creation of the new visitor purpose record to be created via the API must be verified via the API.

    * The api user sets "api/visitorsId" path parameters.
    # Api kullanicisi "/api/visitorsId" path parametrelerini olusturur
    * The api user prepares a GET request containing the <id> information to send to the api visitorsId endpoint.
    # Api kullanicisi api visitorsId endpointine gondermek icin <id> bilgisini iceren bir get request hazirlar
    * The api user sends a GET body and saves the returned response.
    # Api kullanicisi GET body gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular

    Examples:
      | id  |
      | 988 |


