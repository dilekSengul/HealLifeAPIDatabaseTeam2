Feature: As an administrator (admin), I should be able to update the announcement information registered in the system via API connection.

  Scenario Outline: A PATCH request to the "/api/updateNotice" endpoint with valid authorization and correct
  data (id, type, title, description, slug) should return a 200 status code, a response body message of "Success," and
  the "updateId" in the response should match the "id" in the request body. The update should be confirmed via a GET
  request to the "/api/getNoticeById" endpoint using the "updateId" from the response.

    Given The api user sets "api/updateNotice" path parameters.
    When The api user prepares a PATCH request containing <id>, "<type>" ,"<title>", "<description>" and "<slug>" information to send to the api addNotice endpoint.
    Then The api user sends a PATCH request and saves the returned response.
    Then The api user verifies that the status code is 200.
    Then The api user verifies that the "message" information in the response body is "Success".
    And The api user verifies that the updateid information in the Response body is the same as the id information in the patch request body

    Examples:
      | id  |  type           | title   |description  |slug   |
      | 416 | denemenotice    | succes  | api         |succes |

  Scenario Outline: When a PATCH body (id, type, title, description, slug) containing valid authorization information and an invalid (id) is sent to /api/updateNotice endpoint,
the status code returned is 203 and the message in the response body is"Wrong information or missing information.Please check your input data and id number.", and when a PATCH body (type, title, description, slug)
without (id) is sent, the status code returned is 203 and the message in the response body is "Wrong information or missing information. Please check your input data and id number."should be verified.

    Given The api user sets "api/updateNotice" path parameters.
    When The api user prepares a PATCH request containing <id>, "<type>" ,"<title>", "<description>" and "<slug>" information to send to the api addNotice endpoint.
    Then The api user sends a PATCH request and saves the returned response.
    Then  The api user verifies that the status code is 203.
    And The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".

    Examples:
      | id  |  type           | title   |description  |slug   |
      | 878 | denemenotice    | succes  | api         |succes |

  Scenario Outline: When a PATCH body  (id, type, title, description, slug)  that does not contain valid authorization
  information (id) is sent to the /api/updateNotice endpoint, the status code returned is 203 and the
  message information in the response body is "Wrong information or missing information. Please check your input
  data and id number." It should be verified that it is.

    Given The api user sets "api/updateNotice" path parameters.
    When  The api user prepares a PATCH request that does not contain an id but includes  "<type>" ,"<title>", "<description>" and "<slug>" information to send to the api addNotice endpoint.
    Then  The api user sends a PATCH request and saves the returned response.
    Then The api user verifies that the status code is 203.
    And The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".

    Examples:
      |  type           | title   |description  |slug    |
      |  denemenotice   | succes  | api         |succes  |

    Scenario:  When a PATCH request that does not contain valid authorization information and data is sent to the
    /api/updateNotice endpoint, the status code returned is 203 and the message information in the response
    body is "Wrong information or missing information. Please check your input data and id number."

      Given The api user sets "api/updateNotice" path parameters.
      When The api user prepares a PATCH request that does not contain data
      Then The api user sends a PATCH request and saves the returned response as a Json Object.
      And The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".

  Scenario Outline: Invalid Token When sending a PATCH body  (id, type, title, description, slug) with invalid authorization information
  to the /api/updateNotice endpoint, it should be verified that the status code returned is 403 and the message
  in the response body is "You do not have authorization or token error".
    Given The api user sets "api/updateNotice" path parameters.
    When The api user prepares a PATCH request containing <id>, "<type>" ,"<title>", "<description>" and "<slug>" information to send to the api addNotice endpoint.
    Then The api user sends a PATCH request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.

    Examples:
      | id  |  type           | title   | description  | slug  |
      | 416 | denemenotice    | succes  | api          |succes |
  @US
  Scenario Outline: It must be verified via the API that the announcement  record that you want to update via the API
  has been updated.
    Given The api user sets "api/getNoticeById" path parameters.
    When The api user prepares a GET request containing the <id> information to send to the api getNoticeById endpoint.
    Then The api user sends a GET body and saves the returned response.
    And The api user verifies that the "lists.description" information in the response body is "api".

    Examples:
      | id  |
      | 416 |


