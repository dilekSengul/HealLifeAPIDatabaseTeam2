@gulnar
  @US15
  Feature: As an administrator (admin),
    I should be able to access the relevant blood data by entering the id through the API connection.

  Scenario: When a GET body with valid authorization information and correct data (id)
  is sent to the /api/getBloodGroupById endpoint, it should be verified that the status code returned
  is 200 and the message information in the response body is “Success”.

    When The api user sets "api/getBloodGroup" path parameters
    When The api user sends a GET request and saves the returned response.
    And The api user verifies that the status code is 200.
    Then The api user verifies that the "message" information in the response body is "Success".


   Scenario: When a GET request that does not contain valid authorization information and data (id)
   is sent to the /api/getBloodGroupById endpoint, the status code returned is 203 and the message
   information in the response body is "No id or wrong id." When a GET body containing invalid data (id) is sent,
   the status code returned is 203 and the message information in the response body is "No id or wrong id."
   It should be verified that it is.







