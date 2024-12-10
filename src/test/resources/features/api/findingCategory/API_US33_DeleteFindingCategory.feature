Feature: As an administrator (admin), I should be able to unregister the finding category registered in the system via API connection.


  Scenario: TC18: In the DELETE request to /api/deleteFindingCategory endpoint with valid authorisation and correct id information,
  it must be verified that the Status code is 200 and the message field in the response body is ‘Success’.

  #Beklenen ;
      # İstek : Delete
      # Status cod : 200
      # Durum bilgisi : Success

    Given The api user sets "api/deleteFindingCategory" path parameters.
    When The api user prepares a DELETE request to send to the api deleteFindingCategory add endpoint.
    Then The api user sends a DELETE request and saves the returned responsee.
    And The api user verifies that the status code is 200.
    And The api user verifies that the "message" information in the response body is "Success".


  Scenario: TC19: In a DELETE request to /api/deleteFindingCategory endpoint with valid authorisation that does not contain id or contains invalid id information,
  the Status code should be 203 and the message field in the response body should be ‘No id or wrong id. Please check your id number.’ should be verified.

  #Beklenen ;
      # İstek : Delete
      # Status cod : 203
      # Durum bilgisi : No id or wrong id. Please check your id number.

    Given The api user sets "api/deleteFindingCategory" path parameters.
    When The API user prepares to send an invalid DELETE request to the deleteFindingCategory add endpoint.
    Then The api user sends a DELETE request and saves the returned responsee.
    And The api user verifies that the status code is 203.
    And The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".



  Scenario: TC20: In the DELETE request made to the /api/deleteFindingCategory endpoint with Invalid Token authorisation,
  it should be verified that the Status code is 403 and the message field in the response body is ‘You do not have authorisation or token error’.

  #Beklenen ;
      # İstek : Delete
      # Status cod : 403
      # Durum bilgisi : You do not have authorization or token error

    Given The api user sets "api/visitorsPurposeDelete" path parameters.
    When The api user prepares a DELETE request that does not contain data
    Then The api user sends a DELETE request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.


  @ismail
  Scenario: TC21: It should be verified that the id information in the DELETE request sent to the /api/deleteFindingCategory endpoint and the deletedId information in the response body are the same.

  #Beklenen ;
      # İstek : Delete
      # Status cod : 200
      # Durum bilgisi : Request & Response Karşılaştırması

    Given The api user sets "api/deleteFindingCategory" path parameters.
    When The api user prepares a DELETE request to send to the api deleteFindingCategory add endpoint.
    Then The api user sends a DELETE request and saves the returned responsee.
    And The api user verifies that the status code is 200.
    And The api user verifies that the "message" information in the response body is "Success".
    And The api user verifies that the deletedid information is the same as the id information in the request bodyy


  Scenario: TC22: The finding category record to be deleted via the API must be validated with a GET request to the /api/getFindingCategoryById endpoint with the deletedId in the response body.

  #Beklenen ;
      # İstek : Delete & Get
      # Status cod : 203
      # Durum bilgisi : Delete ile silinen kayıt Get ile doğrulanmalı

    Given The api user sets "api/deleteFindingCategory" path parameters.
    When The api user prepares a DELETE request to send to the api deleteFindingCategory add endpoint.
    Then The api user sends a DELETE request and saves the returned response.
    Given The api user sets "api/getFindingCategoryById" path parameters.
    When The api user prepares a GET request containing the <219> information to send to the api getFindingCategoryById endpoint.
    Then The api user sends a GET body and saves the returned response.
    And The api user verifies that the status code is 203.
    And The api user verifies that the "message" information in the response body is "No id or wrong id.".