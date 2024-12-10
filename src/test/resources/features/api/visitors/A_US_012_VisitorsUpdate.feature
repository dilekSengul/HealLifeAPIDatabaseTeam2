Feature: As an administrator (admin), I should be able to update the visitor information registered in the system via API connection.

  Scenario Outline: A PATCH request to the "/api/visitorsPurposeUpdate" endpoint with valid authorization and correct
  data (id, visitors_purpose, description) should return a 200 status code, a response body message of "Success," and
  the "updateId" in the response should match the "id" in the request body. The update should be confirmed via a GET
  request to the "/api/visitorsPurposeId" endpoint using the "updateId" from the response.
