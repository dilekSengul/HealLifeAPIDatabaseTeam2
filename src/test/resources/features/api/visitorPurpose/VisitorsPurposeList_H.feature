@hurrem

Feature: As an administrator (admin) I should be able to access the Visitor Purpose List via API connection.

  Scenario Outline: When a GET request is sent to the /api/visitorsPurposeList endpoint with valid authorization
  information, it should be verified that the status code returned is 200 and the message information in the
  response body is “Success”.

    Given The api user sets "api/visitorsPurposeList" path parameters.
    When The api user sends a GET request and saves the returned response.
    And The api user verifies that the status code is 200.
    Then The api user verifies that the "message" information in the response body is "Success".
    And The api user verifies the information in the response body for the entry with the specified <dataindex> index, including "<visitors_purpose>", "<description>" and "<created_at>".


    Examples:
      | dataindex | visitors_purpose | description        | created_at          |
      | 1         | deneme purpose   | deneme description | 2023-05-22 07:49:20 |


  Scenario: Invalid Token When a GET request is sent to the /api/visitorsPurposeList endpoint with invalid authorization
  information, it should be verified that the status code returned is 403 and the message in the response body is
  "You do not have authorization or token error.".

    Given The api user sets "api/visitorsPurposeList" path parameters.
    * The api user sends a GET request, saves the returned response, and verifies that the status code is 403 with the "message" phrase "You do not have authorization or token error"

