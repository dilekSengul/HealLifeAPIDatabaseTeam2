Feature: As an administrator (admin) I should be able to access the Visitor List via API connection.

  Scenario Outline: When a GET request is sent to the /api/visitorsList endpoint with valid authorization information,
                    it should be verified that the status code returned is 200
                    and the message information in the response body is “Success”.

    * Api user sets "api/visitorsList" path parameters.
    * Api user sends a GET request so saves the returned response.
    * Api user verifies Status Code 200.
    * Api user verifies "message" information in the response body is "Success".
    * Api user verifies the information in response body for entry with specified <dataIndex> index, including "<source>", "<purpose>", "<name>", "<email>", "<note>", "<created_at>".

    Examples:
    | dataIndex | source   | purpose                                    | name      | email                    | note                             | created_at          |
    | 3         | Online   | Hi,   wrote about   the price for reseller | JohnWathe | somasesokiyo31@gmail.com | Hi, kam dashur të di çmimin tuaj | 2024-12-02 19:35:12 |

@US
  Scenario: Invalid Token when a GET request is sent to the /api/visitorsList endpoint with invalid authorization information,
  it should be verified that the status code returned is 403 and
  the message in the response body is "You do not have authorization or token error.".

    * Api user sets "api/visitorsList" path parameters.
    * The api user sends a GET request, then saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.



