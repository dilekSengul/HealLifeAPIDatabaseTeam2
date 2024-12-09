Feature: As an administrator (admin) I want to be able to create a new visitor record via API connection.
@US
  Scenario Outline: A POST request to the "api/visitorsAdd" endpoint with valid authorization and correct data
  should return a 200 status code, a response body with the message "Success,"
  and the creation of the new expense head record should be verified via a GET request to the "api/visitorsId" endpoint using the
  "addId" from the response body.

    * Api user sets "api/visitorsAdd" path parameters.
    * Api user prepares a POST request containing "<purpose>" and "<name>" information to send to the api visitorsAdd endpoint.
    * Api user sends a POST request and saves the returned response.
    * Api user verifies Status Code 200.
    * Api user verifies "message" information in the response body is "Success".

    Examples:
      | purpose   |  name                  |
      | Inquiry   |  Bayram  son eklenen 1 |

    Scenario: When a POST request that does not contain valid authorization information and data is sent to the
    api/visitorsAdd endpoint, the status code returned is 203 and the message information in the response
    body is "No information or missing information. Please check your input data." It should be verified that it is.

    * Api user sets "api/visitorsAdd" path parameters.
    * Api user prepares a POST request that does not contain data.
    * Api user sends a POST request and saves the returned response.
    * Api user verifies Status Code 203.
    * Api user verifies "message" information in the response body is "No information or missing information. Please check your input data".

    Scenario Outline:

