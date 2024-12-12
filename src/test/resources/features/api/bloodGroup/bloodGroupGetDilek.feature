
@US
Feature: As an administrator (admin) I should be able
  to access the list of blood types registered in the system via API connection.

  Scenario:When a GET request is sent to the /api/getBloodGroup endpoint with
  valid authorization information, it should be verified that the status code returned
  is 200 and the message information in the response body is “Success”.

    * The api user sets "api/getBloodGroup" path parameters
    * The api user sends a GET request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Success".

  Scenario: Invalid Token When a GET request is sent to the /api/getBloodGroup endpoint with invalid authorization information, it should be verified that the status code returned is 403 and the message in the response body is "You do not have authorization or token error.".

    * The api user sets "api/getBloodGroup" path parameters.
    * The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.

  Scenario Outline: When a GET request is sent to /api/getBloodGroup endpoint with valid authorization information,
  the information (name, is_blood_group, created_at) returned in the response body of id(x) should be verified.


    * The api user sets "api/getBloodGroup" path parameters.
    * The api user prepares a GET request containing the <id> information to send to the api getExpenseHeadById endpoint.

    Examples:

      | id    |
      | 16 |