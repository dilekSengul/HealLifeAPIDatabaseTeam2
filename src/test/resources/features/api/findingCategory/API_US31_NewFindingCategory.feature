Feature: As an administrator (admin), I want to be able to create a new finding category record via API connection.

  Scenario Outline: TC08: In a POST request to /api/addFindingCategory endpoint with valid authorisation and correct category and created_at information,
  it should be verified that the status code is 200 and the message field in the response body is ‘Success’.

  #Beklenen ;
      # İstek : Post
      # Status cod : 200
      # Durum bilgisi : Success

    Given The api user sets "api/addFindingCategory" path parameters.
    When The api user prepares a POST request containing "<category>" and "<created_at>" information to send to the api addFindingCategory endpoint.
    Then The api user sends a POST request and saves the returned response.
    And The api user verifies that the status code is 200.
    And The api user verifies that the "message" information in the response body is "Success".
    Examples:
      | category               | created_at          |
      | deneme update category | 2024-12-06 12:19:18 |

  Scenario: TC09: In a POST request to /api/addFindingCategory endpoint without data with valid authorisation,
  it must be verified that the Status code is 203 and the message field in the response body is ‘No information or missing information. Please check your input data.’ must be verified.

  #Beklenen ;
      # İstek : Post
      # Status cod : 203
      # Durum bilgisi : No information or missing information. Please check your input data.

    Given The api user sets "api/addFindingCategory" path parameters.
    When The api user prepares a POST request that does not contain data
    Then The api user sends a POST request and saves the returned response.
    And The api user verifies that the status code is 203.
    And The api user verifies that the "message" information in the response body is "No information or missing information. Please check your input data.".

  Scenario Outline: TC10: In a POST request to /api/addFindingCategory endpoint with Invalid Token authorisation and correct category and created_at information,
  it should be verified that the Status code is 403 and the message field in the response body is ‘You do not have authorization or token error’.

  #Beklenen ;
      # İstek : Post
      # Status cod : 403
      # Durum bilgisi : You do not have authorization or token error

    Given The api user sets "api/addFindingCategory" path parameters.
    When The api user prepares a POST request containing "<category>" and "<created_at>" information to send to the api addFindingCategory endpoint.
    Then The api user sends a POST request and saves the returned response.
    And The api user verifies that the status code is 403.
    And The api user verifies that the "message" information in the response body is "You do not have authorization or token error".
    Examples:
      | category               | created_at          |
      | deneme update category | 2024-12-06 12:19:18 |

  Scenario Outline: TC11: The new finding category record created via the API must be validated with a GET request to the /api/getFindingCategoryById endpoint with addId in the response body.

  #Beklenen ;
      # İstek : Get
      # Status cod : 200
      # Durum bilgisi : Post ile eklenen kayıt Get ile doğrulanmalı

    Given The api user sets "api/getFindingCategoryById" path parameters.
    When The api user prepares a GET request containing the <146> information to send to the api getFindingCategoryById endpoint.
    Then The api user sends a GET body and saves the returned response.
    And The api user verifies that the status code is 200.
    And The api user verifies that the "message" information in the response body is "Success".
    And The API user validates the data "<dataIndex>", "<category>" and "<created_at>" contents in the response body..
    Examples:
      | dataIndex | category               | created_at          |
      | 146       | deneme update category | 2024-12-06 12:19:18 |