@hurrem

Feature: As an administrator (admin) I should be able to delete the visitor puspose record in the system via API connection.

  Scenario: A DELETE request to the "/api/visitorsPurposeDelete" endpoint with valid authorization
  and correct data (id) should return a 200 status code, a response body message of "Success," and the "DeletedId" in the
  response should match the "id" in the request body. The deletion should be confirmed by sending a GET request to the
  "/api/visitorsPurposeId" endpoint using the "DeletedId" from the response.

    * The api user sets "api/visitorsPurposeDelete" path parameters.
    * The api user prepares a DELETE request to send to the api visitorsPurposeDelete add endpoint.
    * The api user sends a DELETE request and saves the returned response..
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Success".
    * The api user verifies that the Deletedid information is the same as the id information in the request body

  Scenario: When a DELETE body containing valid authorization information and invalid data (id) is sent to the
  /api/visitorsPurposeDelete endpoint, the status code returned is 203 and the message information in the response
  body is "No id or wrong id. Please check your id number." It should be verified that it is.

    * The api user sets "api/visitorsPurposeDelete" path parameters.
    * The api user prepares a DELETE request to send to the api visitorsPurposeDelete add endpoint.
    * The api user sends a DELETE request and saves the returned response..
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".


  Scenario: When a DELETE request that does not contain valid authorization information and data (id) is sent to the
  /api/visitorsPurposeDelete endpoint, the status code returned is 203 and the message information in the response body
  is "No id or wrong id. Please check your id number." It should be verified that it is.

    * The api user sets "api/visitorsPurposeDelete" path parameters.
    * The api user prepares a DELETE request that does not contain data
    * The api user sends a DELETE request and saves the returned response..
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".

  Scenario: Invalid Token When a DELETE body is sent to the /api/visitorsPurposeDelete endpoint with invalid authorization information,
  it should be verified that the status code returned is 403 and the message in the response body is
  "You do not have authorization or token error".

    * The api user sets "api/visitorsPurposeDelete" path parameters.
    * The api user prepares a DELETE request that does not contain data
    * The api user sends a DELETE request, saves the returned response, and verifies that the status code is 403 with the response body is "You do not have authorization or token error".


  Scenario Outline: It must be verified via the API that the visitor purpose record that is requested to be deleted via
  the API has been deleted.

    * The api user sets "api/visitorsPurposeId" path parameters.
    * The api user prepares a GET request containing the <id> information to send to the api visitorsPurposeid endpoint.
    * The api user sends a GET body and saves the returned response.
    * The api user verifies that the "message" information in the response body is "No id or wrong id.".

    Examples:
      | id  |
      | 844 |