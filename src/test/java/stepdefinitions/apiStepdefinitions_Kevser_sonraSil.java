package stepdefinitions;

import base.BaseTest;
import io.cucumber.java.en.Given;
import org.hamcrest.Matchers;
import org.junit.Assert;
import utilities.api.API_Methods;
import utilities.api.TestData;

import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static utilities.api.API_Methods.fullPath;

public class apiStepdefinitions_Kevser_sonraSil extends BaseTest {

    TestData testData = new TestData();
    String exceptionMesaj = null;

    @Given("The api user sets {string} path parameters..")
    public void the_api_user_sets_path_parameters(String pathParam) {
        API_Methods.pathParam(pathParam);
        // scenario outline'daki parametreyi pathParam olarak tanımladım.
        // utilities>API_Methods'dan pathParam methoduna tanımladığım pathParam parametresini gönderdim.
        // Böylece fullPath oluştu

    }
    @Given("The api user sends a GET request and saves the returned response..")
    public void the_api_user_sends_a_get_request_and_saves_the_returned_response() {
        // response objesini BaseTest'den kullanıyorum(extend)
        response = given().spec(spec).when().get(fullPath);
        response.prettyPrint();

    }
    @Given("The api user verifies that the status code is {int}..")
    public void the_api_user_verifies_that_the_status_code_is(int code) {
        response.then().assertThat().statusCode(code);

    }
    @Given("The api user verifies that the {string} information in the response body is {string}..")
    public void the_api_user_verifies_that_the_information_in_the_response_body_is(String key, String value) {
        response.then().assertThat().body(key, Matchers.equalTo(value));

    }

    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including(int index, String source, String purpose, String name, String email, String contact, String id_proof, String visit_to, String ipd_opd_staff_id, String related_to, String no_of_pepple, String date, String in_time, String out_time, String note, String image, String created_at) {


        repJP = response.jsonPath();  // response ı jsonpath e çevirdi ve repJP olarak atadı
        Assert.assertEquals(source, repJP.getString("lists[" + index + "].source"));
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
        Assert.assertEquals(created_at, repJP.getString("lists[" + index + "].created_at"));

    }


}
