Feature: As an administrator (admin) I should be able to access the finding category list via API connection.

  Scenario: TC01: In a GET request to /api/getFindingCategory endpoint with valid authorisation,
  it must be verified that the Status code is 200 and the message information in the response body is ‘Success’.

  #Beklenen ;
    # İstek : Get
    # Status cod : 200
    # Durum bilgisi : Success

    Given The api user sets "api/getFindingCategory" path parameters.
    When The api user sends a GET request and saves the returned response.
    Then The api user verifies that the status code is 200.
    And The api user verifies that the "message" information in the response body is "Success".

  Scenario: TC02: In GET request to /api/getFindingCategory endpoint with Invalid Token authorisation,
  it should be verified that the Status code is 403 and the message field in the response body is ‘You do not have authorisation or token error’.

  #Beklenen ;
    # İstek : Get
    # Status cod : 403
    # Durum bilgisi : You do not have authorization or token error

    Given The api user sets "api/getFindingCategory" path parameters.
    When The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.

  Scenario Outline: TC03: In a GET request to /api/getFindingCategory endpoint with valid authorisation,
  the category and created_at fields of the record with id 1 must be validated.

  #Beklenen
    # İstek : Get
    # category : KBB
    # created_at : 2023-06-01 13:21:03

    Given The api user sets "api/getFindingCategory" path parameters.
    When The api user sends a GET request and saves the returned response.
    Then The api user verifies that the status code is 200.
    And The api user verifies that the "message" information in the response body is "Success".
    And The API user validates the "<category>" and "<created_at>" information of the "<dataIndex>" index in the response body.

    Examples:
      | dataIndex | category | created_at          |
      | 0         | KBB      | 2023-06-01 13:21:03 |
