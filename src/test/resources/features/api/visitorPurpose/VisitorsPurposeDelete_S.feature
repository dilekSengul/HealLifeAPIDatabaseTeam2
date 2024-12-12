Feature: As an administrator (admin) I should be able to delete the visitor puspose record in the system via API connection.
@serpil
  Scenario: A DELETE request to the "/api/visitorsPurposeDelete" endpoint with valid authorization the "DeletedId" in the
  response should match the "id" in the request body. The deletion should be confirmed by sending a GET request to the
  "/api/visitorsPurposeId" endpoint using the "DeletedId" from the response.

    Given The api user sets "api/visitorsPurposeDelete" path parameters.
    When The api user prepares a DELETE 924 request to send to the api visitorsPurposeDelete add endpoint._
    And The api user sends a DELETE request and saves the returned response._
    Then The api user verifies that the status code is 200.
    And The api user verifies that the "message" information in the response body is "Success".
    And The api user verifies that the Deletedid information is the same as the id information in the request body_



  Scenario: When a DELETE body containing valid authorization information and invalid data (id) is sent to the
  /api/visitorsPurposeDelete endpoint, the status code returned is 203 and the message information in the response
  body is "No id or wrong id. Please check your id number." It should be verified that it is.

    Given The api user sets "api/visitorsPurposeDelete" path parameters.
    When The api user prepares a DELETE 3000 request to send to the api visitorsPurposeDelete add endpoint._
    And The api user sends a DELETE request and saves the returned response._
    Then The api user verifies that the status code is 203.
    And The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".


  Scenario: When a DELETE request that does not contain valid authorization information and data (id) is sent to the
  /api/visitorsPurposeDelete endpoint, the status code returned is 203 and the message information in the response body
  is "No id or wrong id. Please check your id number." It should be verified that it is.

    Given The api user sets "api/visitorsPurposeDelete" path parameters.
    When The api user prepares a DELETE request that does not contain data_
    And The api user sends a DELETE request and saves the returned response._
    Then The api user verifies that the status code is 203.
    And The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".


  Scenario: Invalid Token When a DELETE body is sent to the /api/visitorsPurposeDelete endpoint with invalid authorization information,
  it should be verified that the status code returned is 403 and the message in the response body is
  "You do not have authorization or token error".

    Given The api user sets "api/visitorsPurposeDelete" path parameters.
    When The api user prepares a DELETE request that does not contain data_
    And The api user sends a DELETE request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden._


  Scenario Outline: It must be verified via the API that the visitor purpose record that is requested to be deleted via
  the API has been deleted.


    Given The api user sets "api/visitorsPurposeId" path parameters.
    When The api user prepares a GET request containing the <id> information to send to the api visitorsPurposeid endpoint.
    Then The api user sends a GET body and saves the returned response.
    And The api user verifies that the "message" information in the response body is "No id or wrong id.".


    Examples:
      | id  |
      | 856|