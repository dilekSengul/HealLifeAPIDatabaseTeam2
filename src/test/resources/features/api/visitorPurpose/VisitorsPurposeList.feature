Feature: As an administrator (admin) I should be able to access the Visitor Purpose List via API connection.

  Scenario Outline: When a GET request is sent to the /api/visitorsPurposeList endpoint with valid authorization
  information, it should be verified that the status code returned is 200 and the message information in the
  response body is “Success”.

    * The api user sets "api/visitorsPurposeList" path parameters.
    # Api kullanicisi "api/visitorsPurposeList" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
    * The api user verifies the information in the response body for the entry with the specified <dataindex> index, including "<visitors_purpose>", "<description>" and "<created_at>".
    # Api kullanıcısı response body icindeki <dataIndex> indexe sahip olanin "<visitors_purpose>", "<description>" ve "<created_at>" bilgilerini doğrular.

    Examples:
      | dataindex | visitors_purpose              | description         | created_at          |
      | 0         | Gulten updated some documents | Gulten will be back | 2023-05-18 20:57:12 |


  Scenario: Invalid Token When a GET request is sent to the /api/visitorsPurposeList endpoint with invalid authorization
  information, it should be verified that the status code returned is 403 and the message in the response body is
  "You do not have authorization or token error.".

    * The api user sets "api/visitorsPurposeList" path parameters.
    # Api kullanicisi "api/visitorsPurposeList" path parametrelerini olusturur
    * The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '403' ve reason phrase bilgisinin Forbidden oldugunu dogrular
