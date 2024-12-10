Feature: As an administrator (admin), I should be able to access the
         Visitor information of the user whose id is given through the API connection.

  Scenario Outline: When sending a GET body with valid authorization information and correct data (id) to the
  /api/visitorsId endpoint, it should be verified that the status code returned is 200 and
  he message information in the response body is “Success”.

   * Api user sets "api/visitorsId" path parameters.
   * Api user prepares a GET request containing <id> info to send to api visitorsId endpoint.
   * Api user sends a GET body and saves response.
   * Api user verifies Status Code 200.
   * Api user verifies "message" information in the response body is "Success"
   * Api user verifies the data in response body includes "<id>", "<source>", "<purpose>", "<name>", "<email>".

    Examples:
      | id   | id   | source | purpose | name    | email                   |
      | 1137 | 1137 | Online | Hello   | RoSlads | emilyjonesg89@gmail.com |


  Scenario Outline: When a GET body containing valid authorization information and invalid data (id) is sent to the
  /api/visitorsId endpoint, the status code returned is
  203 and the message information in the response body is
  "No id or wrong id."  It should be verified that it is.

    * Api user sets "api/visitorsId" path parameters.
    * Api user prepares a GET request containing <id> info to send to api visitorsId endpoint.
    * Api user sends a GET body and saves response.
    * Api user verifies Status Code 203.
    * Api user verifies "message" information in the response body is "No id or wrong id."

    Examples:
      | id    |
      | 11222 |


  Scenario: When a GET request that does not contain valid authorization information and data (id) is sent to the
  /api/visitorsId endpoint, the status code returned is
  203 and the message information in the response body is
  "No id or wrong id." It should be verified that it is.

    * Api user sets "api/visitorsId" path parameters.
    * Api user prepares a GET request that does not contain data.
    * Api user sends a GET body and saves response.
    * Api user verifies Status Code 203.
    * Api user verifies "message" information in the response body is "No id or wrong id."


  Scenario Outline:  Invalid Token When sending a GET body with invalid authorization information to the
  /api/visitorsPurposeId endpoint, it should be verified that the status code returned is
  403 and the message in the response body is
  "You do not have authorization or token error".

    * Api user sets "api/visitorsId" path parameters.
    * Api user prepares a GET request containing <id> info to send to api visitorsId endpoint.
    * Api user sends a GET request body, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.

    Examples:
      | id   |
      | 1137 |


