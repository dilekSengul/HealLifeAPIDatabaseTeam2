
Feature: As an administrator, I should be able to update the visitor purpose information registered in the
  system via API connection.

  @serpil
  Scenario Outline: A PATCH request to the "/api/visitorsPurposeUpdate" endpoint with valid authorization and correct
  data (id, visitors_purpose, description) should return a 200 status code, a response body message of "Success," and
  the "updateId" in the response should match the "id" in the request body. The update should be confirmed via a GET
  request to the "/api/visitorsPurposeId" endpoint using the "updateId" from the response.

    * The api user sets "api/visitorsPurposeUpdate" path parameters.
    * The api user prepares a PATCH request containing <id>, "<visitors_purpose>" and "<description>" information to send to the api visitorsPurposeUpdate endpoint.
    * The api user sends a PATCH request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Success".
    * The api user verifies that the updateid information in the Response body is the same as the id information in the patch request body

    Examples:
      | id  | visitors_purpose | description     |
      | 792 | purpose update   | serpil kaydı    |

  @serpil

  Scenario Outline: When a PATCH body (id, visitors_purpose, description) containing valid authorization information
  and invalid (id) is sent to the /api/visitorsPurposeUpdate endpoint, the status code returned is 203 and the message
  information in the response body is "Wrong information or missing information. Please check your input data and id
  number." should be verified.

    * The api user sets "api/visitorsPurposeUpdate" path parameters.
    * The api user prepares a PATCH request containing <id>, "<visitors_purpose>" and "<description>" information to send to the api visitorsPurposeUpdate endpoint.
    * The api user sends a PATCH request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".

    Examples:
      | id    | visitors_purpose | description   |
      | 1001  | purpose update   | serpil kaydı  |


  Scenario Outline: When a PATCH body (visitors_purpose, description) that does not contain valid authorization
  information (id) is sent to the /api/visitorsPurposeUpdate endpoint, the status code returned is 203 and the
  message information in the response body is "Wrong information or missing information. Please check your input
  data and id number." It should be verified that it is.

    * The api user sets "api/visitorsPurposeUpdate" path parameters.
    * The api user sends a PATCH request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".
    Examples:
      | visitors_purpose | description   |
      | purpose update   | serpil kaydı  |


  Scenario: When a PATCH request that does not contain valid authorization information and data is sent to the
  /api/visitorsPurposeUpdate endpoint, the status code returned is 203 and the message information in the response
  body is "Wrong information or missing information. Please check your input data and id number."
  It should be verified that it is.

    * The api user sets "api/visitorsPurposeUpdate" path parameters.
    * The api user prepares a PATCH request that does not contain data
    * The api user sends a PATCH request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".


  Scenario Outline: Invalid Token When sending a PATCH body (id, visitors_purpose, description) with invalid authorization information
  to the /api/visitorsPurposeUpdate endpoint, it should be verified that the status code returned is 403 and the message
  in the response body is "You do not have authorization or token error".

    * The api user sets "api/visitorsPurposeUpdate" path parameters.
    * The api user prepares a PATCH request containing <id>, "<visitors_purpose>" and "<description>" information to send to the api visitorsPurposeUpdate endpoint.
    * The api user sends a PATCH request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.

    Examples:
      | id  | visitors_purpose | description            |
      | 792 | purpose update   | serpil kaydı |

  Scenario Outline: It must be verified via the API that the visitor purpose record that you want to update via the API
  has been updated.

    * The api user sets "api/visitorsPurposeId" path parameters.
    * The api user prepares a GET request containing the <id> information to send to the api visitorsPurposeid endpoint.
    * The api user sends a GET body and saves the returned response.
    * The api user verifies that the "lists.visitors_purpose" information in the response body is "purpose update".

    Examples:
      | id  |
      | 792 |
