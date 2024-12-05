package stepdefinitions;

import base.BaseTest;
import io.cucumber.java.en.Given;
import org.hamcrest.Matchers;
import org.junit.Assert;
import utilities.api.API_Methods;

import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static utilities.api.API_Methods.fullPath;

public class apiStepDefinitionsArzu extends BaseTest {

    @Given("Api user sets {string} path parameters.")
    public void api_user_sets_path_parameters(String pathParameter) {
        API_Methods.pathParam(pathParameter);

    }
    @Given("Api user sends a GET request so saves the returned response.")
    public void api_user_sends_a_get_request_so_saves_the_returned_response() {
        response = given()
                .spec(spec)
                .when()
                .get(fullPath);

        response.prettyPrint();

    }
    @Given("Api user verifies Status Code {int}.")
    public void api_user_verifies_status_code(Integer code) {
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
    @Given("Api user verifies the information in response body for entry with specified {int} index, including {string}, {string}, {string}, {string}, {string}, {string}.")
    public void api_user_verifies_the_information_in_response_body_for_entry_with_specified_index_including(int dataIndex, String source, String purpose, String name, String email, String note, String created_at) {
        repJP = response.jsonPath();

        Assert.assertEquals(source, repJP.getString("lists[" + dataIndex + "].source"));
        Assert.assertEquals(purpose, repJP.getString("lists[" + dataIndex + "].purpose"));
        Assert.assertEquals(name, repJP.getString("lists[" + dataIndex + "].name"));
        Assert.assertEquals(email, repJP.getString("lists[" + dataIndex + "].email"));
        Assert.assertEquals(note, repJP.getString("lists[" + dataIndex + "].note"));
        Assert.assertEquals(created_at, repJP.getString("lists[" + dataIndex + "].created_at"));
    }


}

