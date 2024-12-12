package stepdefinitions;

import base.BaseTest;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.http.ContentType;
import org.hamcrest.Matchers;
import org.json.JSONObject;
import org.junit.Assert;
import utilities.api.TestData;

import static hooks.api.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static utilities.api.API_Methods.fullPath;

public class apiStepdefinitonsDamla extends BaseTest {

    TestData testData = new TestData();
    String exceptionMesaj = null;

    @Then("The api user verifies the information in the response body for the entry with the specified {int} index, including {string}, {string}, {string}, {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int dataIndex, String type, String slug, String url, String title, String date) {

        repJP = response.jsonPath();

        Assert.assertEquals(type,repJP.getString("lists[" + dataIndex + "].type"));
        Assert.assertEquals(slug,repJP.getString("lists[" + dataIndex + "].slug"));
        Assert.assertNull(url,repJP.getString("lists[" + dataIndex + "].url"));
        Assert.assertEquals(title,repJP.getString("lists[" + dataIndex + "].title"));
        Assert.assertEquals(date,repJP.getString("lists[" + dataIndex + "].date"));
    }
    @Then("The api user prepares a GET request containing the {int} information to send to the api getNoticeById endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_information_to_send_to_the_api_get_notice_by_ıd_endpoint(int id) {
        requestBody.put("id", id);

        System.out.println("Get Body : "+ requestBody);

    }

    @Then("The api user verifies that the notice data in the response body includes {string}, {string}, {string}, {string}, {string} and {string}.")
    public void the_api_user_verifies_that_the_data_in_the_response_body_includes_and(String id, String type, String slug, String url, String title, String date) {
      response.then()
              .assertThat()
              .body("lists.id", Matchers.equalTo(id),
                     "lists.type", Matchers.equalTo(type),
                      "lists.slug", Matchers.equalTo(slug),
                      "lists.url", Matchers.is(Matchers.nullValue()),
                      "lists.title", Matchers.equalTo(title),
                      "lists.date", Matchers.equalTo(date));
    }

    @When("The api user prepares a POST request containing {string}, {string}, {string} and {string} information to send to the api addNotice endpoint.")
    public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_add_notice_endpoint(String type, String title, String description, String slug) {
        map.put("type",type);
        map.put("title",title);
        map.put("description",description);
        map.put("slug",slug);

        System.out.println("Post body : "+ map);

    }
    //notice
    @Then("The api user verifies the information in the response body for the entry with the specified {int} index, including {string} ve {string},{string},{string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_ve_and(Integer dataIndex, String type, String slug, String url, String title, String date) {
        response.then()
                .assertThat()
                .body("lists[" + dataIndex + "].type", Matchers.equalTo(type),
                        "lists[" + dataIndex + "].slug", Matchers.equalTo(slug),
                        "lists[" + dataIndex + "].url", Matchers.nullValue(),
                        "lists[" + dataIndex + "].title", Matchers.equalTo(title),
                        "lists[" + dataIndex + "].date", Matchers.equalTo(date));

    }

    @Given("The api user prepares a PATCH request containing {int}, {string} ,{string}, {string} and {string} information to send to the api addNotice endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_and_information_to_send_to_the_api_add_notice_endpoint(int id, String type, String title, String description, String slug) {
        map=testData.noticeUpdateRequestBody(id,type,title,description,slug);

        System.out.println("Patch Body : " + map);
    }
    @When("The api user prepares a PATCH request that does not contain an id but includes  {string} ,{string}, {string} and {string} information to send to the api addNotice endpoint.")
    public void  the_api_user_prepares_a_patch_request_that_does_not_contain_an_id_but_includes_and_information_to_send_to_the_api_update_notice_endpoint(String type, String title, String description, String slug) {

        requestBody.put("type",type);
        requestBody.put("title",title);
        requestBody.put("description",description);
        requestBody.put("slug",slug);
        System.out.println("req body : " + requestBody);

    }
    @When("The api user prepares a PATCH request that does not contain data")
    public void the_api_user_prepares_a_patch_request_that_does_not_contain_data() {
        requestBody=new JSONObject();
    }


    @Then("The api user sends a PATCH request and saves the returned response as a Json Object.")
    public void theApiUserSendsAPATCHRequestAndSavesTheReturnedResponseAsAJsonObject() {
        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(requestBody.toString())
                .patch(fullPath);

        response.prettyPrint();
    }
    @Then("The api user sends a PATCH request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.")
    public void the_api_user_sends_a_patch_request_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_forbidden() {
        try {
            response = given()
                    .spec(spec)
                    .contentType(ContentType.JSON)
                    .when()
                    .body(map)
                    .patch(fullPath);
        } catch (Exception e) {
            exceptionMesaj=e.getMessage();
        }
        System.out.println("exceptionMesaj : " + exceptionMesaj);
        Assert.assertEquals(configLoader.getApiConfig("unauthorizedExceptionMessage"),exceptionMesaj);
    }
    @Given("The api user prepares a DELETE request with id {string} to send to the api apideleteNotice add endpoint.")
    public void the_api_user_prepares_a_delete_request_with_id_to_send_to_the_api_apidelete_notice_add_endpoint(String id) {
        int requestId=Integer.parseInt(id);
        requestBody=new JSONObject();
        requestBody.put("id",requestId);
        System.out.println("Delete Body : " + requestBody.toString());
    }
    @Then("The api user sends a DELETE request and saves the returned response.")
    public void the_api_user_sends_a_delete_request_and_saves_the_returned_response() {
        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(requestBody.toString())
                .delete(fullPath);

        response.prettyPrint();
    }
    @And("The api user verifies that the Deletedid information is the same as the id {string} information in the request body.")
    public void the_api_user_verifies_that_the_deletedid_information_is_the_same_as_the_id_information_in_the_request_body(String id) {

        int deletedId = response.jsonPath().getInt("deletedId");
        Assert.assertEquals(Integer.parseInt(id), deletedId);
    }
    @When("The api user prepares a DELETE request that does not contain data apideleteNotice.")
    public void the_api_user_prepares_a_delete_request_that_does_not_contain_data_api_delete_notice() {

    }

    @And("The api user sends a DELETE request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden deleteNotice.")
    public void theApiUserSendsADELETERequestSavesTheReturnedResponseAndVerifiesThatTheStatusCodeIsWithTheReasonPhraseForbiddenDeleteNotice() {

        try {
            response = given()
                    .spec(spec)
                    .contentType(ContentType.JSON)
                    .when()
                    .body(map)
                    .patch(fullPath);
        } catch (Exception e) {
            exceptionMesaj=e.getMessage();
        }
        System.out.println("exceptionMesaj : " + exceptionMesaj);
        Assert.assertEquals(configLoader.getApiConfig("unauthorizedExceptionMessage"),exceptionMesaj);
    }


    @Then("The API user verifies the contents of the response body, including {string}, {string}, {string}, {string}, {string}, and {string}.")
    public void theAPIUserVerifiesTheContentsOfTheResponseBodyIncludingAnd(String id, String type, String slug, String url, String title, String date) {
        response.then()
                .assertThat().body("lists.id", Matchers.equalTo(id))
                .body("lists.type", Matchers.equalTo(type))
                .body("lists.slug", Matchers.equalTo(slug))
                .body("lists.url", Matchers.nullValue())
                .body("lists.title", Matchers.equalTo(title))
                .body("lists.date", Matchers.equalTo(date));

    }
}
