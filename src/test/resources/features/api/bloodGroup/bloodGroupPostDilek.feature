Feature: As an administrator (admin) I want to be able to create a new visitor purpose record via API connection.

  Scenario Outline: A POST request to the "/api/addBloodGroup" endpoint with valid authorization and correct data
  should return a 200 status code, a response body with the message "Success," and the creation of the new visitor
  purpose record should be verified via a GET request to the "/api/addBloodGroup" endpoint using the "addId"
  from the response body.

    * The api user sets "api/addBloodGroup" path parameters.
    * The api user prepares a POST request containing "<name>" and "<isBloodGroup>" information to send to the api addBloodGroup endpoint.
    * The api user sends a POST request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Success".

    Examples:
      | name        | isBloodGroup |
      | Kan Grubu   | 2              |


  Scenario: When a POST request that does not contain valid authorization information and data is sent to the
  /api/addBloodGroup endpoint, the status code returned is 203 and the message information in the response
  body is "No information or missing information. Please check your input data." It should be verified that it is.

    * The api user sets "api/addBloodGroup" path parameters.
    * The api user prepares a POST request that does not contain data
    * The api user sends a POST request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No information or missing information. Please check your input data.".


  Scenario Outline: Invalid Token /api/addBloodGroup When a POST request is sent to the endpoint
  with correct data (name, is_blood_group) but invalid authorization information, the returned status code must be 403, and the message field in the response body should state: 'You do not have authorization or token error.' This should be verified."
    * The api user sets "api/addBloodGroup" path parameters.
    * The api user prepares a POST request containing "<name>" and "<isBloodGroup>" information to send to the api visitorsPurposeAdd endpoint.
    * The api user sends a POST request and saves the returned response.
    * The api user verifies that the status code is 403.
    * The api user verifies that the "message" information in the response body is "You do not have authorization or token error".

    Examples:
      | name        | isBloodGroup  |
      | Kan Grubu   | 2               |

  Scenario Outline: The creation of the new visitor purpose record to be created via the API must be verified via the API.

    * The api user sets "api/addBloodGroup" path parameters.
    * The api user prepares a Get request containing the <id> information to send to the api addBloodGroup endpoint.
    * The api user sends a GET body and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Success".

    Examples:
      | id  |
      | 514 |