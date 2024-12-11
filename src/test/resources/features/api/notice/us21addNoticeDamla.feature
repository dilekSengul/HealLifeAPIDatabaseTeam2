Feature: As an administrator (admin), I want to be able to create a new announcement record via API connection.

  Scenario Outline: A POST request to the "/api/addNotice" endpoint with valid authorization and correct data
  should return a 200 status code, a response body with the message "Success," and the creation of the new
  notice record should be verified via a GET request to the "/api/addNotice" endpoint using the "addId"
  from the response body.

    Given The api user sets "api/addNotice" path parameters.
    When The api user prepares a POST request containing "<type>", "<title>", "<description>" and "<slug>" information to send to the api addNotice endpoint.
    Then The api user sends a POST request and saves the returned response.
    Then The api user verifies that the status code is 200.
    And The api user verifies that the "message" information in the response body is "Success".

    Examples:
      | type     | title               | description   |slug        |
      | notice   | notice deneme 12345 | notice deneme |noticedeneme|

  Scenario: When a POST request that does not contain valid authorization information and data is sent to the
  /api/addNotice endpoint, the status code returned is 203 and the message information in the response
  body is "No information or missing information. Please check your input data." It should be verified that it is.

    Given The api user sets "api/addNotice" path parameters.
    When The api user prepares a POST request that does not contain data
    Then The api user sends a POST request and saves the returned response.
    Then The api user verifies that the status code is 203.
    And The api user verifies that the "message" information in the response body is "No information or missing information. Please check your input data.".

  Scenario Outline:  Invalid Token information and correct data (type, title, description, slug)
  is sent to /api/addNotice endpoint, it should be verified that the
  status code returned is 403 and the message in the response body is "You do not have authorization or token error".

    Given The api user sets "api/addNotice" path parameters.
    When The api user prepares a POST request containing "<type>", "<title>", "<description>" and "<slug>" information to send to the api addNotice endpoint.
    Then The api user sends a POST request and saves the returned response.
    Then The api user verifies that the status code is 403.
    And The api user verifies that the "message" information in the response body is "You do not have authorization or token error".

    Examples:
      | type     | title               | description   |slug        |
      | notice   | notice deneme 12345 | notice deneme |noticedeneme|

  @US
    Scenario Outline: The creation of the new announcement record to be created through the API must be verified through the API.

      Given The api user sets "api/getNoticeById" path parameters.
      When The api user prepares a GET request containing the <id> information to send to the api getNoticeById endpoint.
      Then The api user sends a GET body and saves the returned response.
      Then The api user verifies that the status code is 200.
      And The api user verifies that the "message" information in the response body is "Success".

      Examples:
        | id  |
        | 393 |


