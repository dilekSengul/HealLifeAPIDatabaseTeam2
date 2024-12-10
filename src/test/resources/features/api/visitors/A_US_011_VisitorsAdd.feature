Feature: As an administrator (admin) I want to be able to create a new visitor record via API connection.


  Scenario Outline: A POST request to the "api/visitorsAdd" endpoint with valid authorization and correct data
  should return a 200 status code, a response body with the message "Success,"
  and the creation of the new expense head record should be verified via a GET request to the "api/visitorsId" endpoint using the
  "addId" from the response body.

    * Api user sets "api/visitorsAdd" path parameters.
    * Api user prepares a POST request containing "<purpose>", "<email>", "<contact>", "<id_proof>", "<visit_to>", "<ipd_opd_staff_id>", "<date>", "<in_time>" and "<out_time>" information to send to the api visitorsAdd endpoint.
    * Api user sends a POST request and saves the returned response.
    * Api user verifies Status Code 200.
    * Api user verifies "message" information in the response body is "Success"

    Examples:
      | purpose | email             | contact    | id_proof | visit_to    | ipd_opd_staff_id | date       | in_time  | out_time |
      | Inquiry | deneme@deneme.com | 9638521770 | 0125856  | opd_patient | 2                | 2023-10-05 | 09:30 PM | 10:30 PM |


    Scenario: When a POST request that does not contain valid authorization information and data is sent to the
    api/visitorsAdd endpoint, the status code returned is 203 and the message information in the response
    body is "No information or missing information. Please check your input data." It should be verified that it is.

    * Api user sets "api/visitorsAdd" path parameters.
    * Api user prepares a POST request that does not contain data.
    * Api user sends a POST request and saves the returned response.
    * Api user verifies Status Code 203.
    * Api user verifies "message" information in the response body is "No information or missing information. Please check your input data."


    Scenario Outline: Invalid Token /api/visitorsAdd endpoint'ine gecersiz authorization bilgileri ile dogru datalar
    (purpose, email, contact, id_proof, visit_to, ipd_opd_staff_id, date, in_time, out_time, note) iceren bir  POST body gönderildiginde dönen status code'in
    403 oldugu ve response body'deki message bilgisinin "You do not have authorization or token error" oldugu dogrulanmali.

      * Api user sets "api/visitorsAdd" path parameters.
      * Api user prepares a POST request containing "<purpose>", "<email>", "<contact>", "<id_proof>", "<visit_to>", "<ipd_opd_staff_id>", "<date>", "<in_time>" and "<out_time>" information to send to the api visitorsAdd endpoint.
      * Api user sends a POST request and saves the returned response.
      * Api user verifies Status Code 403.
      * Api user verifies "message" information in the response body is "You do not have authorization or token error"

    Examples:
      | purpose | email             | contact    | id_proof | visit_to    | ipd_opd_staff_id | date       | in_time  | out_time |
      | Inquiry | deneme@deneme.com | 9638521770 | 0125856  | opd_patient | 2                | 2023-10-05 | 09:30 PM | 10:30 PM |

@US
    Scenario Outline: The creation of the new visitor purpose record to be created via the API must be verified via the API.

      * Api user sets "api/visitorsId" path parameters.
      * Api user prepares a GET request containing <id> info to send to api visitorsId endpoint.
      * Api user sends a GET body and saves response.
      * Api user verifies Status Code 200.
      * Api user verifies "message" information in the response body is "Success"

      Examples:
        | id   |
        | 1254 |



