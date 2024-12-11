Feature: As an administrator (admin) I should be able to delete the visitor record in the system via API connection.


  Scenario: A DELETE request to the "/api/visitorsDelete" endpoint with valid authorization
  and correct data (id) should return a 200 status code, a response body message of "Success," and the "DeletedId" in the
  response should match the "id" in the request body. The deletion should be confirmed by sending a GET request to the
  "/api/visitorsId" endpoint using the "DeletedId" from the response.

    * Api user sets "api/visitorsDelete" path parameters.
    * Api user prepares a DELETE request to send to api visitorsDelete add endpoint.
    * Api user sends a DELETE request and saves response.
    * Api user verifies Status Code 200.
    * Api user verifies "message" information in the response body is "Success"
    * Api user verifies that the Deletedid information is the same as the id information in the request body.



  Scenario: When a DELETE body containing valid authorization information and invalid data (id) is sent to the
  /api/visitorsDelete endpoint, the status code returned is 203 and the message information in the response
  body is "No id or wrong id. Please check your id number." It should be verified that it is.

    * Api user sets "api/visitorsDelete" path parameters.
    * Api user prepares a DELETE request to send to api visitorsDelete add endpoint.
    * Api user sends a DELETE request and saves response.
    * Api user verifies Status Code 203.
    * Api user verifies "message" information in the response body is "No id or wrong id. Please check your id number."



  Scenario: When a DELETE request that does not contain valid authorization information and data (id) is sent to the
  /api/visitorsDelete endpoint, the status code returned is 203 and the message information in the response body
  is "No id or wrong id. Please check your id number." It should be verified that it is.

    * Api user sets "api/visitorsDelete" path parameters.
    * Api user prepares a DELETE request that does not contain data.
    * Api user sends a DELETE request and saves response.
    * Api user verifies Status Code 203.
    * Api user verifies "message" information in the response body is "No id or wrong id. Please check your id number."


  Scenario: Invalid Token When a DELETE body is sent to the /api/visitorsDelete endpoint with invalid authorization information,
  it should be verified that the status code returned is 403 and the message in the response body is
  "You do not have authorization or token error".

    * Api user sets "api/visitorsDelete" path parameters.
    * Api user prepares a DELETE request that does not contain data.
    * Api user sends a DELETE request body, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.

@US
  Scenario Outline: It must be verified via the API that the visitor purpose record that is requested to be deleted via
  the API has been deleted.

    * Api user sets "api/visitorsDelete" path parameters.
    * Api user prepares a GET request containing <id> info to send to api visitorsId endpoint.
    * Api user sends a GET body and saves response.
    * Api user verifies "message" information in the response body is "No id or wrong id."


    Examples:
      | id   |
      | 1258 |