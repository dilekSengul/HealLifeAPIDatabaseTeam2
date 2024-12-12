Feature:As an administrator (admin), I should be able to access announcements via API connection.

Scenario Outline: When a GET request is sent to the /api/getNotice endpoint with valid authorization information, it should be verified that the status code returned is 200 and the message information in the response body is “Success”.

  Given The api user sets "api/getNotice" path parameters.
  Then The api user sends a GET request and saves the returned response.
  Then The api user verifies that the status code is 200.
  Then The api user verifies that the "message" information in the response body is "Success".
  Given The api user verifies the information in the response body for the entry with the specified <dataindex> index, including "<type>", "<slug>", "<url>", "<title>" and "<date>".

  Examples:
    | dataindex | type   | slug           | url            |title                   | date      |
    | 1         | notice | noticedeneme   | null           |notice deneme 12345     |2024-12-09 |


  Scenario: Invalid Token When a GET request is sent to the /api/getNotice endpoint with invalid authorization
information, it should be verified that the status code returned is 403 and the message in the response body is
"You do not have authorization or token error.".

    Given The api user sets "api/getNotice" path parameters.
    Then The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.


