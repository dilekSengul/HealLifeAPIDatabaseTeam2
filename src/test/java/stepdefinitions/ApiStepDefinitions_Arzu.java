package stepdefinitions;

import base.BaseTest;
import io.cucumber.java.en.Given;
import org.hamcrest.Matchers;
import org.junit.Assert;
import utilities.API_Utilities.API_Methods;

import java.util.Map;

import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static utilities.API_Utilities.API_Methods.fullPath;

public class ApiStepDefinitions_Arzu extends BaseTest {

    @Given("Api user sets {string} path parameters.")
    public void api_user_sets_path_parameters(String pathParameters) {
        API_Methods.pathParam(pathParameters);

    }
    @Given("Api user sends a GET request.")
    public void api_user_sends_a_get_request() {
       response = given()
               .spec(spec)
               .when()
               .get(fullPath);

       response.prettyPrint();
    }
    @Given("Api user verifies Status Code {int}.")
    public void api_user_verifies_status_code(int code) {
        response.then()
                .assertThat()
                .statusCode(code);

    }
    @Given("Api user verifies {string} information in the response body is {string}.")
    public void api_user_verifies_information_in_the_response_body_is(String key, String value) {
       response.then()
               .assertThat()
               .body(key, Matchers.equalTo(value));
    }
    @Given("Api user verifies the information in response body for {string}, {string},{string}, {string}, {string},{string}, {string}, {string}, {string},{string}, {string}, {string}, {string},{string}, {string}, {string}, {string}.")
    public void api_user_verifies_the_information_in_response_body_for(int dataindex, Map<String, String> expectedBody) {


        var visitorsData = response.jsonPath().getMap("ipd_opd_staff_id[" + dataindex + "]");

        Assert.assertNotNull("No ipd opd staff found" + dataindex, visitorsData );

        for (Map.Entry<String, String> entry : expectedBody.entrySet()) {
            String field = entry.getKey();
            String expectedValue = entry.getValue();

            if ("null".equals(expectedValue)){
                Assert.assertNull("Field " + field + "is null as expected.", visitorsData.get(field));
            } else if ("".equals(expectedValue)) {
                Assert.assertTrue("Field " + field + " is empty as expected.", visitorsData.get(field) == null || visitorsData.get(field).toString().isEmpty());
            }else {
                Assert.assertEquals("Field " + field + "match the expected value.", expectedValue, visitorsData.get(field).toString());
            }
        }
      }
  }

