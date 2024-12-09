@hurrem
Feature: As an administrator I want to be able to create a new visitor purpose record via API connection.

  Scenario Outline: A POST request to the "/api/visitorsPurposeAdd" endpoint with valid authorization and correct data
  should return a 200 status code, a response body with the message "Success," and the creation of the new visitor
  purpose record should be verified via a GET request to the "/api/visitorsPurposeId" endpoint using the "addId"
  from the response body.

    Given The api user sets "api/visitorsPurposeAdd" path parameters.
    When The api user prepares a POST request containing "<visitors_purpose>" and "<description>" information to send to the api visitorsPurposeAdd endpoint.
    And The api user sends a POST request and saves the returned response.
    Then The api user verifies that the status code is 200.
    And The api user verifies that the "message" information in the response body is "Success".

    Examples:
      | visitors_purpose | description        |
      | deneme purpose   | deneme description |

  Scenario: When a POST request that does not contain valid authorization information and data is sent to the
  /api/visitorsPurposeAdd endpoint, the status code returned is 203 and the message information in the response
  body is "No information or missing information. Please check your input data." It should be verified that it is.

    Given The api user sets "api/visitorsPurposeAdd" path parameters.
    When The api user prepares a POST request that does not contain data
    And The api user sends a POST request and saves the returned response.
    Then The api user verifies that the status code is 203.
    And The api user verifies that the "message" information in the response body is "No information or missing information. Please check your input data.".


  Scenario Outline: Invalid Token /api/visitorsPurposeAdd endpoint'ine gecersiz authorization bilgileri ile dogru datalar
  (visitors_purpose, description) iceren bir  POST body gönderildiginde dönen status code'in 403 oldugu ve
  response body'deki message bilgisinin "You do not have authorization or token error" oldugu dogrulanmali.

    Given The api user sets "api/visitorsPurposeAdd" path parameters.
    When The api user prepares a POST request containing "<visitors_purpose>" and "<description>" information to send to the api visitorsPurposeAdd endpoint.
    And The api user sends a POST request and saves the returned response.
    Then The api user verifies that the status code is 403.
    And The api user verifies that the "message" information in the response body is "You do not have authorization or token error".

    Examples:
      | visitors_purpose | description        |
      | deneme purpose   | deneme description |


  Scenario Outline: The creation of the new visitor purpose record to be created via the API must be verified via the API.

    Given The api user sets "api/visitorsPurposeId" path parameters.
    When The api user prepares a GET request containing the <id> information to send to the api visitorsPurposeid endpoint.
    And The api user sends a GET body and saves the returned response.
    Then The api user verifies that the status code is 200.
    And The api user verifies that the "message" information in the response body is "Success".


    Examples:
      | id  |
      | 785 |


