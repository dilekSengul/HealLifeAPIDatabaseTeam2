Feature: As an administrator I should be able to access the Visitor Purpose information of the user
  whose id is given through the API connection.
@serpil
  Scenario Outline: When sending GET body with valid authorization information and correct data (id) to the
  /api/visitorsPurposeId endpoint, it should be verified that the status code returned is 200 and the message
  information in the response body is “Success”.

    Given The api user sets "api/visitorsPurposeId" path parameters.
    When The api user prepares a GET request containing the <id> information to send to the api visitorsPurposeid endpoint.
    And  The api user sends a GET body and saves the returned response.
    Then The api user verifies that the status code is 200.
    And The api user verifies that the "message" information in the response body is "Success".
    And The api user verifies that the data in the response body includes "<id>", "<visitors_purpose>", "<description>" and "<created_at>".


    Examples:
      | id | visitors_purpose              | description         | created_at          |
      | 39 |deneme visitors_purpose        | deneme description  | 2023-05-23 01:03:21 |


  Scenario Outline: When a GET body containing valid authorization information and invalid data (id) is sent to the
  /api/visitorsPurposeId endpoint, the status code returned is 203 and the message information in the response body
  is "No id or wrong id." It should be verified that it is.

    Given The api user sets "api/visitorsPurposeId" path parameters.
    When  The api user prepares a GET request containing the <id> information to send to the api visitorsPurposeid endpoint.
    And  The api user sends a GET body and saves the returned response.
    Then The api user verifies that the status code is 203.
    And The api user verifies that the "message" information in the response body is "No id or wrong id.".


    Examples:
      | id     |
      | 30000 |

  Scenario: When a GET request that does not contain valid authorization information and data (id) is sent to the
  /api/visitorsPurposeId endpoint, the status code returned is 203 and the message information in the response body is
  "No id or wrong id." It should be verified that it is.

    Given The api user sets "api/visitorsPurposeId" path parameters.
    When The api user prepares a GET request that does not contain data
    And The api user sends a GET body and saves the returned response.
    Then The api user verifies that the status code is 203.
    And The api user verifies that the "message" information in the response body is "No id or wrong id.".



  Scenario Outline: Invalid Token When sending a GET body with invalid authorization information to the /api/visitorsPurposeId
  endpoint, it should be verified that the status code returned is 403 and the message in the response body is
  "You do not have authorization or token error".

    Given The api user sets "api/visitorsPurposeId" path parameters.
    When The api user prepares a GET request containing the <id> information to send to the api visitorsPurposeid endpoint.
    And The api user sends a GET body, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.


    Examples:
      | id |
      | 30001 |
