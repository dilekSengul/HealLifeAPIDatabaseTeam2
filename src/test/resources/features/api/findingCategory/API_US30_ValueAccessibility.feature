Feature: As an administrator (admin), I should be able to access the relevant finding category data by entering id via API connection.

  Scenario: TC04: In a GET request to /api/getFindingCategoryById endpoint with valid authorisation and correct id,
  it must be verified that the Status code is 200 and the message field in the response body is ‘Success’.

  #Beklenen ;
      # İstek : Get
      # Status cod : 200
      # Durum bilgisi : Success

    Given The api user sets "api/getFindingCategoryById" path parameters.
    When The api user prepares a GET request containing the <1> information to send to the api getFindingCategoryById endpoint.
    Then The api user sends a GET body and saves the returned response.
    And The api user verifies that the status code is 200.
    And The api user verifies that the "message" information in the response body is "Success".

  Scenario Outline: TC05: In a GET request to /api/getFindingCategoryById endpoint with valid authorisation and correct id, the id,
  category and created_at fields in the response body must be validated.

  #Beklenen ;
      # İstek : Get
      # id : 1
      # category : KBB
      # created_at : 2023-06-01 13:21:03

    Given The api user sets "api/getFindingCategoryById" path parameters.
    When The api user prepares a GET request containing the <1> information to send to the api getFindingCategoryById endpoint.
    Then The api user sends a GET body and saves the returned response.
    And The api user verifies that the status code is 200.
    And The api user verifies that the "message" information in the response body is "Success".
    And The API user validates the data "<dataIndex>", "<category>" and "<created_at>" contents in the response body..
    Examples:
      | dataIndex | category | created_at          |
      | 1         | KBB      | 2023-06-01 13:21:03 |

  Scenario: TC06: In a GET request to /api/getFindingCategoryById endpoint with valid authorisation with no id or invalid id,
  it should be verified that the Status code is 203 and the message field in the response body is ‘No id or wrong id.’.

  #Beklenen ;
      # İstek : Get
      # Status cod : 203
      # Durum bilgisi : No id or wrong id.

    Given The api user sets "api/getFindingCategoryById" path parameters.
    When The api user prepares a GET request that does not contain data
    Then The api user sends a GET request and saves the returned response.
    And The api user verifies that the status code is 203.
    And The api user verifies that the "message" information in the response body is "No id or wrong id.".

  Scenario: TC07: In GET request to /api/getFindingCategoryById endpoint with Invalid Token authorisation,
  it should be verified that the status code is 403 and the message field in the response body is ‘You do not have authorization or token error’.

  #Beklenen ;
      # İstek : Get
      # Status cod : 403
      # Durum bilgisi : You do not have authorization or token error

    Given The api user sets "api/getFindingCategoryById" path parameters.
    When The api user prepares a GET request containing the <1> information to send to the api getFindingCategoryById endpoint.
    When The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.