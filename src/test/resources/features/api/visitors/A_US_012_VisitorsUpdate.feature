Feature: As an administrator (admin), I should be able to update the visitor information registered in the system via API connection.


  Scenario Outline: A PATCH request to the " /api/visitorsUpdate" endpoint with valid authorization and correct
  data (id, purpose, email, contact, id_proof, visit_to, ipd_opd_staff_id, date, in_time, out_time, note) should return a 200 status code,
  a response body message of "Success," and the "updateId" in the response should match the "id" in the request body. The update should be confirmed via a GET
  request to the "/api/visitorsId" endpoint using the "updateId" from the response.

    * Api user sets "api/visitorsUpdate" path parameters.
    * Api user prepares a PATCH request containing <id>, "<purpose>", "<email>", "<contact>", "<id_proof>", "<visit_to>", "<ipd_opd_staff_id>", "<date>", "<in_time>" and "<out_time>" information to send to the api visitorsUpdate endpoint.
    * Api user sends a PATCH request and saves the returned response.
    * Api user verifies Status Code 200.
    * Api user verifies "message" information in the response body is "Success"
    * Api user verifies that the updateid information in the Response body is the same as the id information in the patch request body.

    Examples:
      | id   | purpose | email             | contact    | id_proof | visit_to    | ipd_opd_staff_id | date       | in_time  | out_time |
      | 1258 | Inquiry | deneme@deneme.com | 9638521770 | 0125856  | opd_patient | 2                | 2023-10-05 | 09:30 PM | 10:30 PM |


  Scenario Outline: When a PATCH body (id, purpose, email, contact, id_proof, visit_to, ipd_opd_staff_id, date, in_time, out_time, note) containing valid authorization information
  and invalid (id) is sent to the /api/visitorsUpdate endpoint, the status code returned is 203
  and the message information in the response body is "Wrong information or missing information. Please check your input data and id number." should be verified.

    * Api user sets "api/visitorsUpdate" path parameters.
    * Api user prepares a PATCH request containing <id>, "<purpose>", "<email>", "<contact>", "<id_proof>", "<visit_to>", "<ipd_opd_staff_id>", "<date>", "<in_time>" and "<out_time>" information to send to the api visitorsUpdate endpoint.
    * Api user sends a PATCH request and saves the returned response.
    * Api user verifies Status Code 203.
    * Api user verifies "message" information in the response body is "Wrong information or missing information. Please check your input data and id number."

    Examples:
      | id     | purpose | email             | contact    | id_proof | visit_to    | ipd_opd_staff_id | date       | in_time  | out_time |
      | 125858 | Inquiry | deneme@deneme.com | 9638521770 | 0125856  | opd_patient | 2                | 2023-10-05 | 09:30 PM | 10:30 PM |


  Scenario Outline: When a PATCH body (purpose, email, contact, id_proof) that does not contain valid authorization
  information (id) is sent to the /api/visitorsUpdate endpoint, the status code returned is 203 and the message information in the response body is
  "Wrong information or missing information. Please check your input data and id number." It should be verified that it is.

    * Api user sets "api/visitorsUpdate" path parameters.
    * Api user prepares a PATCH request that does not contain an id but includes "<purpose>", "<email>", "<contact>", "<id_proof>" information to send to the api visitorsUpdate endpoint.
    * Api user sends a PATCH request and saves the returned response.
    * Api user verifies Status Code 203.
    * Api user verifies "message" information in the response body is "Wrong information or missing information. Please check your input data and id number."

    Examples:
      | purpose | email             | contact    | id_proof |
      | Inquiry | deneme@deneme.com | 9638521770 | 0125856  |


  Scenario: When a PATCH request that does not contain valid authorization information and data is sent to the
  /api/visitorsUpdate endpoint, the status code returned is 203 and the message information in the response body is
  "Wrong information or missing information. Please check your input data and id number." It should be verified that it is.

    * Api user sets "api/visitorsUpdate" path parameters.
    * Api user prepares a PATCH request that does not contain data
    * Api user sends a PATCH request and saves the returned response.
    * Api user verifies Status Code 203.
    * Api user verifies "message" information in the response body is "Wrong information or missing information. Please check your input data and id number."


    Scenario Outline: Invalid Token When sending a PATCH body (id, purpose, email, contact, id_proof) with invalid authorization information
    to the /api/visitorsUpdate endpoint, it should be verified that the status code returned is
    403 and the message in the response body is "You do not have authorization or token error".

      * Api user sets "api/visitorsUpdate" path parameters.
      * Api user prepares a PATCH request containing <id>, "<purpose>", "<email>", "<contact>", "<id_proof>", "<visit_to>", "<ipd_opd_staff_id>", "<date>", "<in_time>" and "<out_time>" information to send to the api visitorsUpdate endpoint.
      * Api user sends a PATCH request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.

      Examples:
        | id   | purpose | email             | contact    | id_proof | visit_to    | ipd_opd_staff_id | date       | in_time  | out_time |
        | 1258 | Inquiry | deneme@deneme.com | 9638521770 | 0125856  | opd_patient | 2                | 2023-10-05 | 09:30 PM | 10:30 PM |


      Scenario Outline: It must be verified via the API that the visitor record that you want to update via the API has been updated.

        * Api user sets "api/visitorsId" path parameters.
        * Api user prepares a GET request containing <id> info to send to api visitorsId endpoint.
        * Api user sends a GET body and saves response.
        * Api user verifies "lists.purpose" information in the response body is "Inquiry"

        Examples:
          | id   |
          | 1258 |





