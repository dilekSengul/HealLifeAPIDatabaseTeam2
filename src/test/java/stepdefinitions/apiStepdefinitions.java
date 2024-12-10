
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
import pojos.Pojo;
import utilities.api.API_Methods;
import utilities.api.TestData;

import java.util.Map;

import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static org.junit.Assert.assertEquals;
import static utilities.api.API_Methods.fullPath;

public class apiStepdefinitions extends BaseTest {

    TestData testData = new TestData();
    String exceptionMesaj = null;

    @Given("The api user sets {string} path parameters.")
    public void the_api_user_sets_path_parameters(String pathParam) {
        API_Methods.pathParam(pathParam);
    }

    @Given("The api user sends a GET request and saves the returned response.")
    public void the_api_user_sends_a_get_request_and_saves_the_returned_response() {
        response = given()
                .spec(spec)
                .when()
                .get(fullPath);

        response.prettyPrint();
    }

    @Given("The api user verifies that the status code is {int}.")
    public void the_api_user_verifies_that_the_status_code_is(int code) {
        response.then()
                .assertThat()
                .statusCode(code);
    }

    @Given("The api user verifies that the {string} information in the response body is {string}.")
    public void the_api_user_verifies_that_the_information_in_the_response_body_is(String key, String value) {
        response.then()
                .assertThat()
                .body(key, Matchers.equalTo(value));
    }

    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {string}, {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int dataIndex, String visitors_purpose, String description, String created_at) {
        repJP = response.jsonPath();

        assertEquals(visitors_purpose, repJP.getString("lists[" + dataIndex + "].visitors_purpose"));
        assertEquals(description, repJP.getString("lists[" + dataIndex + "].description"));
        assertEquals(created_at, repJP.getString("lists[" + dataIndex + "].created_at"));
    }

    @Given("The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.")
    public void the_api_user_sends_a_get_request_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_forbidden() {
        try {
            response = given()
                    .spec(spec)
                    .when()
                    .get(fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }

        System.out.println("exceptionMesaj : " + exceptionMesaj);
        assertEquals(configLoader.getApiConfig("unauthorizedExceptionMessage"), exceptionMesaj);

    }

    @Given("The api user prepares a GET request containing the {int} information to send to the api visitorsPurposeid endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_information_to_send_to_the_api_visitors_purposeid_endpoint(int id) {
        requestBody.put("id", id);

        System.out.println("Get Body : " + requestBody);
    }

    @Given("The api user sends a GET body and saves the returned response.")
    public void the_api_user_sends_a_get_body_and_saves_the_returned_response() {
        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(requestBody.toString())
                .get(fullPath);

        response.prettyPrint();
    }

    @Given("The api user verifies that the data in the response body includes {string}, {string}, {string} and {string}.")
    public void the_api_user_verifies_that_the_data_in_the_response_body_includes_and(String id, String visitors_purpose, String description, String created_at) {
        response.then()
                .assertThat()
                .body("lists.id", Matchers.equalTo(id),
                        "lists.visitors_purpose", Matchers.equalTo(visitors_purpose),
                        "lists.description", Matchers.equalTo(description),
                        "lists.created_at", Matchers.equalTo(created_at));

    }

    @Given("The api user prepares a GET request that does not contain data")
    public void the_api_user_prepares_a_get_request_that_does_not_contain_data() {
    }

    @Given("The api user sends a GET body, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.")
    public void the_api_user_sends_a_get_body_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_forbidden() {
        try {
            response = given()
                    .spec(spec)
                    .contentType(ContentType.JSON)
                    .when()
                    .body(requestBody.toString())
                    .get(fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }

        System.out.println("exceptionMesaj : " + exceptionMesaj);
        assertEquals(configLoader.getApiConfig("unauthorizedExceptionMessage"), exceptionMesaj);
    }

    @Given("The api user prepares a POST request containing {string} and {string} information to send to the api visitorsPurposeAdd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_visitors_purpose_add_endpoint(String visitors_purpose, String description) {
        map.put("visitors_purpose", visitors_purpose);
        map.put("description", description);

        System.out.println("Post Body : " + map);
    }


    @Given("The api user sends a POST request and saves the returned response.")
    public void the_api_user_sends_a_post_request_and_saves_the_returned_response() {
        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(map)
                .post(fullPath);

        response.prettyPrint();
    }

    @Given("The api user prepares a POST request that does not contain data")
    public void the_api_user_prepares_a_post_request_that_does_not_contain_data() {
    }

    @Given("The api user prepares a PATCH request containing {int}, {string} and {string} information to send to the api visitorsPurposeUpdate endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_and_information_to_send_to_the_api_visitors_purpose_update_endpoint(int id, String visitors_purpose, String description) {
        map = testData.visitorsPurposeUpdateRequestBody(id, visitors_purpose, description);

        System.out.println("Patch Body : " + map);
    }

    @Given("The api user sends a PATCH request and saves the returned response.")
    public void the_api_user_sends_a_patch_request_and_saves_the_returned_response() {
        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(map)
                .patch(fullPath);

        response.prettyPrint();
    }

    @Given("The api user verifies that the updateid information in the Response body is the same as the id information in the patch request body")
    public void the_api_user_verifies_that_the_updateid_information_in_the_response_body_is_the_same_as_the_id_information_in_the_patch_request_body() {
        repJP = response.jsonPath();

        assertEquals(map.get("id"), repJP.getInt("updateId"));
    }

    //expenseHead-Onur\\

    @Given("The api user prepares a POST request containing {string} and {string} information to send to the api addExpenseHead endpoint.")
    public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_addExpenseHead_endpoint(String exp_category, String description) {
        map.put("exp_category", exp_category);
        map.put("description", description);

        System.out.println("Post Body : " + map);
    }

    @Given("The api user prepares a GET request containing the {int} information to send to the api getExpenseHeadById endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_information_to_send_to_the_api_getExpenseHeadById_endpoint(int id) {
        requestBody.put("id", id);

        System.out.println("Get Body : " + requestBody);
    }


    @Given("The api user verifies that the data in the response body includes {string}, {string}, {string}, {string}, {string} and {string}.")
    public void the_api_user_verifies_that_the_data_in_the_response_body_includes_and(String id, String exp_category, String description, String is_active, String is_deleted, String created_at) {
        // Parametrelerin API'deki JSON yolunu ve değerlerini eşleştiren map
        Map<String, String> fields = Map.of(
                "details.exp_category", exp_category,
                "details.description", description,
                "details.is_active", is_active,
                "details.is_deleted", is_deleted,
                "details.created_at", created_at
        );
        // id kontrolü
        response.then()
                .assertThat()
                .body("details.id", Matchers.equalTo(id));

        // String içerisinde null sorununu önlemek için diğer tüm parametrelerin null kontrol döngüsü
        for (Map.Entry<String, String> entry : fields.entrySet()) {
            String jsonPath = entry.getKey();
            String expectedValue = entry.getValue();

            if ("null".equals(expectedValue)) {
                // null ise
                response.then().body(jsonPath, Matchers.nullValue());
            } else {
                // null değilse
                response.then().body(jsonPath, Matchers.equalTo(expectedValue));
            }
        }
    }


    @Given("The api user verifies the information in the response body for the entry with the specified {string} index, including {string}, {string}, {string}, {string} and {string}.")
    public void theApiUserVerifiesTheInformationInTheResponseBodyForTheEntryWithTheSpecifiedIdIndexIncludingAnd(String id, String exp_category, String description, String is_active, String is_deleted, String created_at) {
        repJP = response.jsonPath();

        assertEquals(exp_category, repJP.getString("lists[" + id + "].exp_category"));
        assertEquals(description, repJP.getString("lists[" + id + "].description"));
        assertEquals(is_active, repJP.getString("lists[" + id + "].is_active"));
        assertEquals(is_deleted, repJP.getString("lists[" + id + "].is_deleted"));
        assertEquals(created_at, repJP.getString("lists[" + id + "].created_at"));
    }


    @Given("The api user prepares a PATCH request containing {int}, {string} and {string} information to send to the api updateExpenseHead endpoint.")
    public void theApiUserPreparesAPATCHRequestContainingAndInformationToSendToTheApiupdateExpenseHeadEndpoint(int id, String exp_category, String description) {
        map = testData.expenseHeadUpdateRequestBody(id, exp_category, description);

        System.out.println("Patch Body : " + map);
    }

    @Given("The api user prepares a PATCH request that does not contain an id but includes {string} and {string} information to send to the api updateExpenseHead endpoint.")
    public void theApiUserPreparesAPATCHRequestThatDoesNotContainAnIdButIncludesAndInformationToSendToTheApiUpdateExpenseHeadEndpoint(String arg0, String arg1) {

    }

    //GET REQUEST WITH INVALID TOKEN BY ONUR
    @Given("The api user sends a GET request, saves the returned response, and verifies that the status code is {int} with the {string} phrase {string}")
    public void theApiUserSendsAGETRequestSavesTheReturnedResponseAndVerifiesThatTheStatusCodeIsWithThePhrase(int code, String key, String value) {

        response = given()
                .spec(spec)
                .when()
                .get(fullPath);

        response.prettyPrint();

        response.then()
                .assertThat()
                .statusCode(code)
                .body(key, Matchers.equalTo(value));
    }

    //PATCH REQUEST WITH INVALID TOKEN BY ONUR
    @Given("The api user sends a PATCH request, saves the returned response, and verifies that the status code is {int} with the {string} phrase {string}")
    public void theApiUserSendsAPATCHRequestSavesTheReturnedResponseAndVerifiesThatTheStatusCodeIsWithThePhrase(int code, String key, String value) {
        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(map)
                .patch(fullPath);
        response.prettyPrint();

        response.then()
                .assertThat()
                .statusCode(code)
                .body(key, Matchers.equalTo(value));
    }

    @Given("The api user prepares a DELETE request with id {string} to send to the api deleteExpenseHead add endpoint.")
    public void the_api_user_prepares_a_delete_request_with_id_to_send_to_the_api_deleteExpenseHead_add_endpoint(int id) {

        requestBody = new JSONObject();
        requestBody.put("id", id);
        System.out.println("Delete Body : " + requestBody.toString());
    }

    @Given("The api user prepares a DELETE request to send to the api deleteExpenseHead add endpoint.")
    public void the_api_user_prepares_a_delete_request_to_send_to_the_api_deleteExpenseHead_add_endpoint() {
        requestBody.put("id", 848);

        System.out.println("Delete Body : " + requestBody);
    }


//Gulnar

    @When("The api user sets {string} path parameters")
    public void theApiUserSetsPathParameters(String pathparam) {
        API_Methods.pathParam(pathparam);
    }


    @Given("The api user prepares a GET request containing \\{int}, \\{string} ,\\{int},\\{int} information to send to the api updateExpenseHead endpoint.")
    public void the_api_user_prepares_a_get_request_containing_information_to_send_to_the_api_update_expense_head_endpoint() {


    }


    @Given("The  api user {int} invalid authorization")
    public void the_api_user_invalid_authorization(Integer int1) {
        ;

        String invalidToken = "invalidToken";


    }

    @Given("The api user prepares a DELETE {int} request to send to the api visitorsPurposeDelete add endpoint._")
    public void the_api_user_prepares_a_delete_request_to_send_to_the_api_visitors_purpose_delete_add_endpoint_(int id) {
        requestBody.put("id", id);

        System.out.println("Delete Body : " + requestBody);
    }

    @Given("The api user sends a DELETE request and saves the returned response._")
    public void the_api_user_sends_a_delete_request_and_saves_the_returned_response_() {
        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(requestBody.toString())
                .delete(fullPath);

        response.prettyPrint();
    }

    @Given("The api user verifies that the Deletedid information is the same as the id information in the request body_")
    public void the_api_user_verifies_that_the_deletedid_information_is_the_same_as_the_id_information_in_the_request_body_() {
        repJP = response.jsonPath();

        Assert.assertEquals(requestBody.get("id"), repJP.getInt("DeletedId"));
    }

    @Given("The api user prepares a DELETE request that does not contain data_")
    public void the_api_user_prepares_a_delete_request_that_does_not_contain_data_() {

    }

    @Given("The api user sends a DELETE request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden._")
    public void the_api_user_sends_a_delete_request_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_forbidden_() {
        try {
            response = given()
                    .spec(spec)
                    .contentType(ContentType.JSON)
                    .when()
                    .body(requestBody.toString())
                    .delete(fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }

        System.out.println("exceptionMesaj : " + exceptionMesaj);
        Assert.assertEquals(configLoader.getApiConfig("unauthorizedExceptionMessage"), exceptionMesaj);
    }

    @Given("The api user prepares a DELETE request to send to the api visitorsPurposeDelete add endpoint.")
    public void the_api_user_prepares_a_delete_request_to_send_to_the_api_visitors_purpose_delete_add_endpoint() {
        requestBody.put("id", 848);

        System.out.println("Delete Body : " + requestBody);
    }

    @Given("The api user sends a DELETE request and saves the returned response..")
    public void the_api_user_sends_a_delete_request_and_saves_the_returned_response() {
        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(requestBody.toString())
                .delete(fullPath);

        response.prettyPrint();
    }

    @Given("The api user verifies that the Deletedid information is the same as the id information in the request body")
    public void the_api_user_verifies_that_the_deletedid_information_is_the_same_as_the_id_information_in_the_request_body() {
        repJP = response.jsonPath();
        Assert.assertEquals(requestBody.get("id"), repJP.getInt("DeletedId"));
    }

    @Given("The api user prepares a DELETE request that does not contain data")
    public void the_api_user_prepares_a_delete_request_that_does_not_contain_data() {

    }


    @When("The api user prepares a PATCH request that does not contain an id but includes {string} and {string} information to send to the api visitorsPurposeUpdate endpoint.")
    public void the_api_user_prepares_a_patch_request_that_does_not_contain_an_id_but_includes_and_information_to_send_to_the_api_visitors_purpose_update_endpoint(String visitors_purpose, String description) {

        requestBody.put("visitors_purpose", visitors_purpose);
        requestBody.put("description", description);

    }

    @When("The api user prepares a GET request containing the {int} information to send to the api visitorsPurposeid endpoint and save returned response")
    public void the_api_user_prepares_a_get_request_containing_the_information_to_send_to_the_api_visitors_purposeid_endpoint_and_save_returned_response(int id) {
        requestBody.put("id", id);

        response = given()
                .spec(spec)
                .when()
                .body(requestBody.toString())
                .get(fullPath);

        response.prettyPrint();
    }


    @Given("The api user sends a DELETE request, saves the returned response, and verifies that the status code is {int} with the response body is {string}.")
    public void the_api_user_sends_a_delete_request_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_response_body_is(int statusCode, String message) {
        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(requestBody.toString())
                .delete(fullPath);

        response.then()
                .assertThat()
                .statusCode(statusCode)
                .body("message", Matchers.equalTo(message));


    }
    //bloodgrouppost


    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including(int index, String purpose, String name, String email, String contact, String id_proof, String visit_to, String ipd_opd_staff_id, String related_to, String no_of_pepple, String date, String in_time, String out_time, String note, String image) {


        repJP = response.jsonPath();  // response ı jsonpath e çevirdi ve repJP olarak atadı
        Assert.assertEquals(purpose, repJP.getString("lists[" + index + "].purpose"));
        Assert.assertEquals(name, repJP.getString("lists[" + index + "].name"));
        Assert.assertEquals(email, repJP.getString("lists[" + index + "].email"));
        Assert.assertEquals(contact, repJP.getString("lists[" + index + "].contact"));
        Assert.assertEquals(id_proof, repJP.getString("lists[" + index + "].id_proof"));
        Assert.assertEquals(visit_to, repJP.getString("lists[" + index + "].visit_to"));
        Assert.assertEquals(ipd_opd_staff_id, repJP.getString("lists[" + index + "].ipd_opd_staff_id"));
        Assert.assertEquals(related_to, repJP.getString("lists[" + index + "].related_to"));
        Assert.assertEquals(no_of_pepple, repJP.getString("lists[" + index + "].no_of_pepple"));
        Assert.assertEquals(date, repJP.getString("lists[" + index + "].date"));
        Assert.assertEquals(in_time, repJP.getString("lists[" + index + "].in_time"));
        Assert.assertEquals(out_time, repJP.getString("lists[" + index + "].out_time"));
        Assert.assertEquals(note, repJP.getString("lists[" + index + "].note"));
        Assert.assertEquals(image, repJP.getString("lists[" + index + "].image"));

    }


    @Given("The api user verifies that the data in the response body includes {string}, {string}, {string}, {string}, {string}, {string}, {string}.")
    public void the_api_user_verifies_that_the_data_in_the_response_body_includes_and(String id, String purpose, String name, String email, String contact, String id_proof, String visit_to) {
        response.then()
                .assertThat()
                .body("lists.id", Matchers.equalTo(id),
                        "lists.purpose", Matchers.equalTo(purpose),
                        "lists.name", Matchers.equalTo(name),
                        "lists.email", Matchers.equalTo(email),
                        "lists.contact", Matchers.equalTo(contact),
                        "lists.id_proof", Matchers.equalTo(id_proof),
                        "lists.visit_to", Matchers.equalTo(visit_to));
    }

    @Given("The api user prepares a GET request containing the {int} information to send to the api visitorsId endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_information_to_send_to_the_api_visitors_ıd_endpoint(Integer id) {
    }
        @Given("The api user prepares a POST request containing {string} and {string} information to send to the api addBloodGroup endpoint.")
        public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_add_blood_group_endpoint
        (String name, String isBloodGroup){
            map.put("name", name);
            map.put("is_blood_group", isBloodGroup);

            System.out.println("Post Body : " + map);
        }

        @Given("The api user prepares a Get request containing the {int} information to send to the api addBloodGroup endpoint.")
        public void the_api_user_prepares_a_get_request_containing_the_information_to_send_to_the_api_add_blood_group_endpoint
        (Integer id){
            requestBody.put("id", id);

            System.out.println("Get Body : " + requestBody);
        }
        @Given("The api user prepares a PATCH request containing {int}, {string} and {string} information to send to the api updateBloodGroup endpoint.")
        public void the_api_user_prepares_a_patch_request_containing_and_information_to_send_to_the_api_update_blood_group_endpoint
        ( int id, String name, String is_blood_group){
            map = testData.bloodUpdateRequestBody(id, name, is_blood_group);

            System.out.println("Patch Body : " + map);
        }


        @And("The API user validates the {string} and {string} information of the {string} index in the response body.")
        public void theAPIUserValidatesTheAndInformationOfTheIndexInTheResponseBody (String category, String
        created_at, String data){
            repJP = response.jsonPath();

            Assert.assertEquals(category, repJP.getString("lists[" + data + "].category"));
            Assert.assertEquals(created_at, repJP.getString("lists[" + data + "].created_at"));
        }


        @When("The api user prepares a GET request containing the <{int}> information to send to the api getFindingCategoryById endpoint.")
        public void theApiUserPreparesAGETRequestContainingTheInformationToSendToTheApiGetFindingCategoryByIdEndpoint (
        int id){

            requestBody.put("id", id);

            System.out.println("Get Body : " + requestBody);
        }


        @Given("The api user prepares a POST request containing {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string} and {string} information to send to the api visitorsAdd endpoint.")
        public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_visitors_purpose_add_endpoint
        (String purpose, String name, String email, String contact, String id_proof, String visit_to, String
        ipd_opd_staff_id, String related_to, String no_of_pepple, String date, String in_time, String out_time, String
        note)
        {
            map.put("purpose", purpose);
            map.put("name", name);
            map.put("email", email);
            map.put("contact", contact);
            map.put("id_proof", id_proof);
            map.put("visit_to", visit_to);
            map.put("ipd_opd_staff_id", ipd_opd_staff_id);
            map.put("related_to", related_to);
            map.put("no_of_pepple", no_of_pepple);
            map.put("date", date);
            map.put("in_time", in_time);
            map.put("out_time", out_time);
            map.put("note", note);
        }


            @And("The API user validates the data {string}, {string} and {string} contents in the response body..")
            public void theAPIUserValidatesTheDataAndContentsInTheResponseBODY (String id, String category, String
            created_at){
            response.then()
                    .assertThat()
                    .body("details.id", Matchers.equalTo(id),
                            "details.category", Matchers.equalTo(category),
                            "details.created_at", Matchers.equalTo(created_at));
        }

            @When("The api user prepares a POST request containing {string} and {string} information to send to the api addFindingCategory endpoint.")
            public void theApiUserPreparesAPOSTRequestContainingAndInformationToSendToTheApiAddFindingCategoryEndpoint
            (String category, String created_at){
            map.put("category", category);
            map.put("created_at", created_at);


            System.out.println("Post Body : " + map);
        }


            @Given("The api user prepares a PATCH request containing {int}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string} information to send to the api visitorsUpdate endpoint.")
            public void the_api_user_prepares_a_patch_request_containing_information_to_send_to_the_api_visitors_update_endpoint
            ( int id, String purpose, String name, String email, String contact, String id_proof, String
            visit_to, String ipd_opd_staff_id, String related_to, String no_of_pepple, String date, String
            in_time, String out_time, String note){
            map = testData.visitorsUpdateRequestBody(id, purpose, name, email, contact, id_proof, visit_to, ipd_opd_staff_id, related_to, no_of_pepple, date, in_time, out_time, note);
            }
            @When("The api user prepares a PATCH request containing {int}, {string} and {string} information to send to the api updateFindingCategory endpoint.")
            public void theApiUserPreparesAPATCHRequestContainingAndInformationToSendToTheApiUpdateFindingCategoryEndpoint
            ( int id, String category, String created_at){
                map = testData.findingCategoryUpdateRequestBody(id, category, created_at);


                System.out.println("Patch Body : " + map);
            }


            @Given("The api user prepares a PATCH request that does not contain an id but includes {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string} information to send to the api visitorsUpdate endpoint.")
            public void the_api_user_prepares_a_patch_request_that_does_not_contain_an_id_but_includes_and_information_to_send_to_the_api_visitors_update_endpoint
            (String purpose, String name, String email, String contact, String id_proof, String visit_to, String
            ipd_opd_staff_id, String related_to, String no_of_pepple, String date, String in_time, String
            out_time, String note){

                requestBody.put("purpose", purpose);
                requestBody.put("name", name);
                requestBody.put("email", email);
                requestBody.put("contact", contact);
                requestBody.put("id_proof", id_proof);
                requestBody.put("visit_to", visit_to);
                requestBody.put("ipd_opd_staff_id", ipd_opd_staff_id);
                requestBody.put("related_to", related_to);
                requestBody.put("no_of_pepple", no_of_pepple);
                requestBody.put("date", date);
                requestBody.put("in_time", in_time);
                requestBody.put("out_time", out_time);
                requestBody.put("note", note);
            }


            @When("The api user prepares a GET request containing the <id> information to send to the api updateFindingCategory endpoint.")
            public void theApiUserPreparesAGETRequestContainingTheIdInformationToSendToTheApiUpdateFindingCategoryEndpoint
            () {
            }

            @Given("The api user prepares a GET request containing the {int} information to send to the api updateFindingCategory endpoint.")
            public void the_api_user_prepares_a_get_request_containing_the_information_to_send_to_the_api_update_finding_category_endpoint
            ( int id){
                requestBody.put("id", id);

                System.out.println("Get Body : " + requestBody);
            }

            @When("The api user prepares a DELETE request to send to the api deleteFindingCategory add endpoint.")
            public void the_api_user_prepares_a_delete_request_to_send_to_the_api_delete_finding_category_add_endpoint
            () {
                requestBody.put("id", 240);

                System.out.println("Delete Body : " + requestBody);
            }

            @When("The API user prepares to send an invalid DELETE request to the deleteFindingCategory add endpoint.")
            public void the_apı_user_prepares_to_send_an_invalid_delete_request_to_the_delete_finding_category_add_endpoint
            () {
                requestBody.put("id", 99999);

                System.out.println("Delete Body : " + requestBody);
            }

            @Given("The api user sends a DELETE request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.")
            public void the_api_user_sends_a_delete_request_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_forbidden
            () {
                try {
                    response = given()
                            .spec(spec)
                            .contentType(ContentType.JSON)
                            .when()
                            .body(requestBody.toString())
                            .delete(fullPath);
                } catch (Exception e) {
                    exceptionMesaj = e.getMessage();
                }

                System.out.println("exceptionMesaj : " + exceptionMesaj);
                Assert.assertEquals(configLoader.getApiConfig("unauthorizedExceptionMessage"), exceptionMesaj);
            }

            @Then("The api user sends a DELETE request and saves the returned responsee.")
            public void the_api_user_sends_a_delete_request_and_saves_the_returned_responsee () {
                response = given()
                        .spec(spec)
                        .contentType(ContentType.JSON)
                        .when()
                        .body(requestBody.toString())
                        .delete(fullPath);

                response.prettyPrint();
            }

            @Given("The api user verifies that the deletedid information is the same as the id information in the request bodyy")
            public void the_api_user_verifies_that_the_deletedid_information_is_the_same_as_the_id_information_in_the_request_bodyy
            () {
                repJP = response.jsonPath();

                Assert.assertEquals(requestBody.get("id"), repJP.getInt("deletedId"));
            }

        }



