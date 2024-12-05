Feature: As an administrator (admin), I should be able to access the relevant announcement data by entering id through the API connection.

  Scenario Outline: When sending a GET body with valid authorization information and correct data (id) to the
  /api/getNoticeById endpoint, it should be verified that the status code returned is 200 and the message
  information in the response body is “Success”.

    Given The api user sets "api/getNoticeById" path parameters.
    Then The api user prepares a GET request containing the <id> information to send to the api getNoticeById endpoint.
    Then The api user sends a GET body and saves the returned response.
    Then The api user verifies that the status code is 200.
    And The api user verifies that the "message" information in the response body is "Success".
    Then The api user verifies that the notice data in the response body includes "<id>", "<type>", "<slug>", "<url>", "<title>" and "<date>".

    Examples:
      | id  | id  | type   | slug  | url  | title| date      |
      | 341 | 341 | notice | Ein   | null |hallo |2023-06-02 |

    Scenario Outline: When a GET body containing valid authorization information and invalid data (id) is sent to the
    /api/getNoticeById endpoint, the status code returned is 203 and the message information in the response body
    is "No id or wrong id." It should be verified that it is.

      Given The api user sets "api/getNoticeById" path parameters.
      When The api user prepares a GET request containing the <id> information to send to the api getNoticeById endpoint.
      Then The api user sends a GET body and saves the returned response.
      Then The api user verifies that the status code is 203.
      And The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".

      Examples:
         |id        |
         |  24532   |

    Scenario:  When a GET request that does not contain valid authorization information and data (id) is sent to the
    /api/getNoticeById endpoint, the status code returned is 203 and the message information in the response body is
    "No id or wrong id." It should be verified that it is.

      Given The api user sets "api/getNoticeById" path parameters.
      When The api user prepares a GET request that does not contain data
      Then The api user sends a GET body and saves the returned response.
      Then The api user verifies that the status code is 203.
      And The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".
  @US
    Scenario Outline: Invalid Token When sending a GET body with invalid authorization information to the /api/getNoticeById
    endpoint, it should be verified that the status code returned is 403 and the message in the response body is
    "You do not have authorization or token error".

      Given The api user sets "api/getNoticeById" path parameters.
      When The api user prepares a GET request containing the <id> information to send to the api getNoticeById endpoint.
      Then The api user sends a GET body, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.

      Examples:
      |  id  |
      | 341  |
