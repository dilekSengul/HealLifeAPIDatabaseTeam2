package stepdefinitions;

import base.BaseTest;
import io.cucumber.java.en.Given;
import io.restassured.http.ContentType;
import org.hamcrest.Matchers;
import org.junit.Assert;
import utilities.api.API_Methods;

import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static utilities.api.API_Methods.fullPath;

public class apiStepDefinitions_Arzu extends BaseTest {


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

    @Given("The api user sends a GET request, then saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.")
    public void the_api_user_sends_a_get_request_then_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_forbidden() {
        response = given()
                .spec(spec)
                .when()
                .get(fullPath);

        response.prettyPrint();

        response.then()
                .assertThat()
                .statusCode(403)
                .body(Matchers.containsString("You do not have authorization or token error."));
    }


    @Given("Api user prepares a GET request containing {int} info to send to api visitorsId endpoint.")
    public void api_user_prepares_a_get_request_containing_info_to_send_to_api_visitors_id_endpoint(int id) {
        requestBody.put("id", id);

        System.out.println("Body " + requestBody);
    }

    @Given("Api user sends a GET body and saves response.")
    public void api_user_sends_a_get_body_and_saves_response() {
        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(requestBody.toString())
                .get(fullPath);

        response.prettyPrint();
    }

    @Given("Api user verifies the data in response body includes {string}, {string}, {string}, {string}, {string}.")
    public void api_user_verifies_the_data_in_response_body_includes_and(String id, String source, String purpose, String name, String email) {
        response.then()
                .assertThat()
                .body("lists.id", Matchers.equalTo(id),
                        "lists.source", Matchers.equalTo(source),
                        "lists.purpose", Matchers.equalTo(purpose),
                        "lists.name", Matchers.equalTo(name),
                        "lists.email", Matchers.equalTo(email));
    }

    @Given("Api user prepares a GET request that does not contain data.")
    public void api_user_prepares_a_get_request_that_does_not_contain_data() {

    }

    @Given("Api user sends a GET request body, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.")
    public void the_api_user_sends_a_get_request_body_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_phrase() {
        response = given()
                .spec(spec)
                .when()
                .get(fullPath);

        response.prettyPrint();

        response.then()
                .assertThat()
                .statusCode(403)
                .body(Matchers.containsString("You do not have authorization or token error"));

    }

    @Given("Api user prepares a POST request containing {string} and {string} information to send to the api visitorsAdd endpoint.")
    public void api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_visitors_add_endpoint(String purpose, String name) {
        map.put("purpose",purpose);
        map.put("name",name);

        System.out.println("Post Body " + map);

    }
    @Given("Api user sends a POST request and saves the returned response.")
    public void api_user_sends_a_post_request_and_saves_the_returned_response() {
      response = given()
              .spec(spec)
              .contentType(ContentType.JSON)
              .when()
              .body(map)
              .post(fullPath);

      response.prettyPrint();

        System.out.println("Body " + response.getBody().asString());
        System.out.println("Header " + response.getHeaders());
    }


}