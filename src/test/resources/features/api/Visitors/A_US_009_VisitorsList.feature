Feature: As an administrator (admin) I should be able to access the Visitor List via API connection.

  @US009
  Scenario Outline: When a GET request is sent to the /api/visitorsList endpoint with valid authorization information,
                    it should be verified that the status code returned is 200
                    and the message information in the response body is “Success”.

    * Api user sets "api/visitorsList" path parameters.
    * Api user sends a GET request.
    * Api user verifies Status Code 200.
    * Api user verifies "message" information in the response body is "Success".
    * Api user verifies the information in response body for "<dataindex>", "<source>","<purpose>", "<name>", "<email>","<contact>", "<id_proof>", "<visit_to>", "<ipd_opd_staff_id>","<related_to>", "<no_of_pepple>", "<date>", "<in_time>","<out_time>", "<note>", "<image>", "<created_at>".

    Examples:
      | dataindex | source   | purpose                              | name      | email                     | contact | id_proof | visit_to | ipd_opd_staff_id | related_to | no_of_pepple | date       | in_time | out_time | note                              | image | created_at          |
      | 3         | Online   | Hi, wrote about the price for reseller | JohnWathe | somasesokiyo31@gmail.com | ""      | ""       | ""       | null             | ""         | 0            | 2024-12-02 | ""      | ""       | Hi, kam dashur të di çmimin tuaj | ""    | 2024-12-02 19:35:12 |
