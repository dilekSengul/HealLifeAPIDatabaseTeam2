Feature: As an administrator (admin), I should be able to update the visitor purpose information registered in the
  system via API connection.
  Scenario:  When a PATCH request that does not contain valid authorization information and data is sent to the
  api/updateBloodGroup endpoint, the status code returned is 203 and the message information in the response
  body is "Wrong information or missing information. Please check your input data and id number."
  It should be verified that it is.

    * The api user sets "api/updateBloodGroup" path parameters.
    * The api user prepares a PATCH request that does not contain data
    * The api user sends a PATCH request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".


  Scenario Outline: When a PATCH body (id, name, is_blood_group) containing valid authorization information
  and invalid (id) is sent to the api/updateBloodGroup endpoint, the status code returned is 203 and the message
  information in the response body is "Wrong information or missing information. Please check your input data and id
  number." should be verified.

    * The api user sets "api/updateBloodGroup" path parameters.
    * The api user prepares a PATCH request containing <id>, "<name>" and "<is_blood_group>" information to send to the api updateExpenseHead endpoint.
    * The api user sends a PATCH request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".

    Examples:
      | id    | name | is_blood_group            |
      | 85692 | test dilek   | test dilekk|


  Scenario Outline: When a PATCH body (name, updateBloodGroup) that does not contain valid authorization
  information (id) is sent to the api/updateBloodGroup endpoint, the status code returned is 203 and the
  message information in the response body is "Wrong information or missing information. Please check your input
  data and id number." It should be verified that it is.

    * The api user sets "api/updateBloodGroup" path parameters.
    * The api user prepares a PATCH request that does not contain an id but includes "<name>" and "<is_blood_group>" information to send to the api updateExpenseHead endpoint.
    * The api user sends a PATCH request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".

    Examples:
      | name | is_blood_group          |
      | test dilek   | test dilekk |


  Scenario:  When a PATCH request that does not contain valid authorization information and data is sent to the
  api/updateBloodGroup endpoint, the status code returned is 203 and the message information in the response
  body is "Wrong information or missing information. Please check your input data and id number."
  It should be verified that it is.

    * The api user sets "api/updateBloodGroup" path parameters.
    * The api user prepares a PATCH request that does not contain data
    * The api user sends a PATCH request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".

  Scenario Outline: Invalid Token When sending a PATCH body (id, name, is_blood_group) with invalid authorization information
  to the /api/updateBloodGroup endpoint, it should be verified that the status code returned is 403 and the message
  in the response body is "You do not have authorization or token error".

    * The api user sets "api/updateBloodGroup" path parameters.
    * The api user prepares a PATCH request containing <id>, "<name>" and "<is_blood_group>" information to send to the api addBloodGroup endpoint.
    * The api user sends a PATCH request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.

    Examples:
      | id  | name     | is_blood_group |
      | 562 | test dilek  | test dilekk |


  Scenario Outline: It must be verified via the API that the expense head record that you want to update via the API
  has been updated.

    * The api user sets "api/getBloodGroupById" path parameters.
    * The api user prepares a GET request containing the <id> information to send to the api getBloodGroupById endpoint.
    * The api user sends a GET body and saves the returned response.
    * The api user verifies that the "lists.name" information in the response body is "test dilek".

    Examples:
      | id  |
      | 562 |

