@smoke
Feature: As an administrator (admin), I want to be able to create a new announcement record via API connection.


  Scenario Outline: A POST request to the "/api/addNotice" endpoint with valid authorization and correct data
  should return a 200 status code, a response body with the message "Success," and the creation of the new visitor
  purpose record should be verified via a GET request to the "body to /api/getNoticeById" endpoint using the "addId"
  from the response body.

    Given The api user sets "api/addNotice" path parameters.
    # Api kullanicisi "api/addNotice" path parametrelerini olusturur
    When The api user prepares a POST request containing "<type>", "<title>", "<description>" and "<slug>" information to send to the api addNotice endpoint.
    # Api kullanicisi api visitorsPurposeAdd endpointine gondermek icin "<type>" ,"<title>, "<description>"ve "< slug>" bilgilerini iceren bir post request hazirlar
    Then The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    Then The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    Then The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular

    Examples:
      | type     | title  |description  |slug|
      | deneme   | hallo    | canim       |hallo  |



  Scenario: When a POST request that does not contain valid authorization information and data is sent to the
  /api/addNotice endpoint, the status code returned is 203 and the message information in the response
  body is "No information or missing information. Please check your input data." It should be verified that it is.
    #/api/addNotice endpoint'ine gecerli authorization bilgileri ve data icermeyen bir POST request gönderildiginde de dönen status code'in 203 oldugu ve response body'deki message bilgisinin
    # "No information or missing information. Please check your input data." oldugu dogrulanmali.

    Given The api user sets "api/addNotice" path parameters.
    # Api kullanicisi "api/addNotice" path parametrelerini olusturur
    When The api user prepares a POST request that does not contain data
    # Api kullanicisi data icermeyen bir post request hazırlar
    Then The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    Then The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    Then The api user verifies that the "message" information in the response body is "No information or missing information. Please check your input data.".
    # Api kullanicisi response bodydeki message bilgisinin "No information or missing information. Please check your input data." oldugunu dogrular


  Scenario Outline: Invalid Token When a POST body with invalid authorization information and correct data (type, title, description, slug) is sent to /api/addNotice endpoint, it should be verified that the status code returned is 403 and the message
                    in the response body is "You do not have authorization or token error".
   # /api/addNotice endpoint'ine gecersiz authorization bilgileri ile dogru datalar
   # (visitors_purpose, description) iceren bir  POST body gönderildiginde dönen status code'in 403 oldugu ve
   # response body'deki message bilgisinin "You do not have authorization or token error" oldugu dogrulanmali.

    Given The api user sets "api/addNotice" path parameters.
    # Api kullanicisi "api/addNotice" path parametrelerini olusturur
    When The api user prepares a POST request containing "<type>", "<title>", "<description>" and "<slug>" information to send to the api addNotice endpoint.
    # Api kullanicisi api api/addNotice endpointine gondermek icin "<type>" ,"<title>, "<description>"ve "< slug>" bilgilerini iceren bir post request hazirlar
    Then The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    Then The api user verifies that the status code is 403.
    # Api kullanicisi status codeun 403 oldugunu dogrular
    Then The api user verifies that the "message" information in the response body is "You do not have authorization or token error".
    # Api kullanicisi response bodydeki message bilgisinin "You do not have authorization or token error" oldugunu dogrular


    Examples:
      | type     | title  |description  |slug|
      | deneme   | hallo    | canim       |hallo  |


  Scenario Outline: The creation of the new announcement  record to be created via the API must be verified via the API.
   # API uzerinden olusturulmak istenen yeni duyuru kaydinin olustugu API uzerinden dogrulanmali.

    Given The api user sets "api/getNoticeById" path parameters.
    # Api kullanicisi "api/addNotice" path parametrelerini olusturur
    When The api user prepares a GET request containing the <id> information to send to the api getNoticeById endpoint.
    # Api kullanicisi api getNoticeById endpointine gondermek icin <id> bilgisini iceren bir get request hazirlar
    Then The api user sends a GET body and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    Then The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    Then The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular

    Examples:
      | id  |
      | 403 |