@US
Feature: As an administrator (admin), I should be able to access the relevant Expense Head data by entering id via API connection.

  Scenario Outline: When a GET body with valid authorization information and correct data (id) is sent to the
  /api/getBloodGroupById endpoint, it should be verified that the status code returned is
  200 and the message information in the response body is “Success”.

    * The api user sets "api/getBloodGroupById" path parameters.
    * The api user prepares a GET request containing the <id> information to send to the api getExpenseHeadById endpoint.
    * The api user sends a GET body and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Success".
    * The api user verifies that the data in the response body includes "<id>", "<name>", "<is_blood_group>" and "<created_at>".
    Examples:
      | id | id | name | is_blood_group | created_at |
      | 4  |  4 | AB+  | 1              | 2021-10-25 06:32:48|


  Scenario Outline: When a GET body containing valid authorization information and invalid data (id) is sent to the
  /api/getBloodGroupById endpoint, the status code returned is 203 and the message information in the response body
  is "No id or wrong id." It should be verified that it is.

    * The api user sets "api/getBloodGroupById" path parameters.
    * The api user prepares a GET request containing the <id> information to send to the api getExpenseHeadById endpoint.
    * The api user sends a GET body and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id or wrong id.".

    Examples:
      | id     |
      | 1789   |


  Scenario: When a GET request that does not contain valid authorization information and data (id) is sent to the
  /api/getBloodGroupById endpoint, the status code returned is 203 and the message information in the response body is
  "No id or wrong id." It should be verified that it is.

    * The api user sets "api/getBloodGroupById" path parameters.
    * The api user prepares a GET request that does not contain data
    * The api user sends a GET request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id or wrong id.".

  Scenario Outline: Invalid Token When sending a GET body with invalid authorization information to the /api/getBloodGroupById
  endpoint, it should be verified that the status code returned is 403 and the message in the response body is
  "You do not have authorization or token error".

    * The api user sets "api/getBloodGroupById" path parameters.
    * The api user prepares a GET request containing the <id> information to send to the api visitorsPurposeid endpoint.
    * The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
    Examples:
      | id |
      | 25 |