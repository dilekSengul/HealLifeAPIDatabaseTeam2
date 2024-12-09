Feature: As an administrator (admin) I should be able to delete the announcement record in the system via API connection.

  Scenario Outline: A DELETE request to the "/api/deleteNotice" endpoint with valid authorization
  and correct data (id) should return a 200 status code, a response body message of "Success," and the "DeletedId" in the
  response should match the "id" in the request body. The deletion should be confirmed by sending a GET request to the
  "/api/getNoticeById " endpoint using the "DeletedId" from the response.

    Given The api user sets "<endpoint>" path parameters.
    When The api user prepares a DELETE request with id "<id>" to send to the api apideleteNotice add endpoint.
    Then The api user sends a DELETE request and saves the returned response.
    Then The api user verifies that the status code is 200.
    Then The api user verifies that the "message" information in the response body is "Success".
    And The api user verifies that the Deletedid information is the same as the id "<id>" information in the request body.

    Examples:
      | endpoint         | id  |
      | api/deleteNotice | 577 |

  Scenario Outline: When a DELETE body containing valid authorization information and invalid data (id) is sent to the
  "/api/deleteNotice" endpoint, the status code returned is 203 and the message information in the response
  body is "No id or wrong id. Please check your id number." It should be verified that it is.

    Given The api user sets "<endpoint>" path parameters.
    When The api user prepares a DELETE request with id "<id>" to send to the api apideleteNotice add endpoint.
    Then The api user sends a DELETE request and saves the returned response.
    Then The api user verifies that the status code is 203.
    And The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".

    Examples:
      | endpoint         | id  |
      | api/deleteNotice | 8756 |

  Scenario: When a DELETE request that does not contain valid authorization information and data (id) is sent to the
  "/api/deleteNotice" endpoint, the status code returned is 203 and the message information in the response body
  is "No id or wrong id. Please check your id number." It should be verified that it is.

    Given The api user sets "api/deleteNotice" path parameters.
    When The api user prepares a DELETE request that does not contain data apideleteNotice.
    Then The api user sends a DELETE request and saves the returned response.
    Then The api user verifies that the status code is 203.
    And The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".

  Scenario: Invalid Token When a DELETE body is sent to the"/api/deleteNotice" endpoint with invalid authorization information,
  it should be verified that the status code returned is 403 and the message in the response body is
  "You do not have authorization or token error".

    Given The api user sets "api/deleteNotice" path parameters.
    When The api user prepares a DELETE request that does not contain data apideleteNotice.
    And The api user sends a DELETE request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden deleteNotice.


  Scenario Outline: It must be verified via the API that the notice record that is requested to be deleted via
  the API has been deleted.

    Given The api user sets "api/getNoticeById" path parameters.
    When The api user prepares a GET request containing the <id> information to send to the api getNoticeById endpoint.
    Then The api user sends a GET body and saves the returned response.
    And The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".

    Examples:
      | id  |
      | 577 |
