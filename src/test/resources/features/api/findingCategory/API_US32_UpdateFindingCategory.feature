Feature: As an administrator (admin), I should be able to update the finding category information registered in the system via API connection.

  Scenario Outline: TC12: /api/updateFindingCategory endpoint with valid authorisation and correct id and category information,
  it must be verified that the Status code is 200 and the message field in the response body is ‘Success’.

  #Beklenen ;
      # İstek : PATCH
      # Status cod : 200
      # Durum bilgisi : Success

    Given The api user sets "api/updateFindingCategory" path parameters.
    When The api user prepares a PATCH request containing <id>, "<category>" and "<created_at>" information to send to the api updateFindingCategory endpoint.
    Then The api user sends a PATCH request and saves the returned response.
    And The api user verifies that the status code is 200.
    And The api user verifies that the "message" information in the response body is "Success".
    Examples:
      | id  | category               | created_at          |
      | 234 | Deneme Update Category | 2024-12-06 12:33:30 |

  Scenario Outline: TC13: /api/updateFindingCategory endpoint with valid authorisation with or without invalid id,
  the Status code is 203 and the message field in the response body is ‘Wrong information or missing information. Please check your input data and id number.’

  #Beklenen ;
      # İstek : PATCH
      # Status cod : 203
      # Durum bilgisi : Wrong information or missing information. Please check your input data and id number.

    Given The api user sets "api/updateFindingCategory" path parameters.
    When The api user prepares a PATCH request containing <id>, "<category>" and "<created_at>" information to send to the api updateFindingCategory endpoint.
    Then The api user sends a PATCH request and saves the returned response.
    And The api user verifies that the status code is 203.
    And The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".
    Examples:
      | id     | category               | created_at          |
      | 989898 | deneme update category | 2024-12-06 12:32:30 |


  Scenario: TC14: In a PATCH request to /api/updateFindingCategory endpoint without data with valid authorisation,
  it must be verified that the Status code is 203 and the message field in the response body is ‘Wrong information or missing information. Please check your input data and id number.’

  #Beklenen ;
      # İstek : PATCH
      # Status cod : 203
      # Durum bilgisi : Wrong information or missing information. Please check your input data and id number.

    Given The api user sets "api/updateFindingCategory" path parameters.
    When The api user prepares a PATCH request that does not contain data
    Then The api user sends a PATCH request and saves the returned response.
    And The api user verifies that the status code is 203.
    And The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".


  Scenario Outline: TC15: In a PATCH request to the /api/updateFindingCategory endpoint with Invalid Token authorisation,
  it should be verified that the Status code is 403 and the message field in the response body is ‘You do not have authorization or token error’.

  #Beklenen ;
      # İstek : PATCH
      # Status cod : 403
      # Durum bilgisi : You do not have authorization or token error

    Given The api user sets "api/visitorsPurposeUpdate" path parameters.
    When The api user prepares a PATCH request containing <id>, "<category>" and "<created_at>" information to send to the api updateFindingCategory endpoint.
    Then The api user sends a PATCH request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.

    Examples:
      | id  | category               | created_at          |
      | 234 | Deneme Update Category | 2024-12-06 12:33:30 |

  Scenario Outline: TC16: It should be verified that the id information in the PATCH request sent to the /api/updateFindingCategory endpoint and the updateId information in the response body are the same.

  #Beklenen ;
      # İstek : PATCH
      # Status cod : 200
      # Durum bilgisi : Success

    Given The api user sets "api/updateFindingCategory" path parameters.
    When The api user prepares a PATCH request containing <id>, "<category>" and "<created_at>" information to send to the api updateFindingCategory endpoint.
    Then The api user sends a PATCH request and saves the returned response.
    And The api user verifies that the status code is 200.
    And The api user verifies that the "message" information in the response body is "Success".
    And The api user verifies that the updateid information in the Response body is the same as the id information in the patch request body
    Examples:
      | id  | category               | created_at          |
      | 234 | Deneme Update Category | 2024-12-06 12:33:30 |

  Scenario Outline: TC17: The finding category record to be updated via API,
  /api/getFindingCategoryById with updateId in response body
  must be verified with a GET request to the endpoint.

  #Beklenen ;
      # İstek : GET
      # Status cod : 200
      # Durum bilgisi : Success

    Given The api user sets "api/getFindingCategoryById" path parameters.
    When The api user prepares a GET request containing the <id> information to send to the api updateFindingCategory endpoint.
    Then The api user sends a GET body and saves the returned response.
    And The api user verifies that the "details.category" information in the response body is "Deneme Update Category".
    Examples:
      | id  |
      | 234 |