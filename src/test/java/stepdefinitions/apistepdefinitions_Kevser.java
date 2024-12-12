package stepdefinitions;

import base.BaseTest;
import io.cucumber.java.en.Given;
import org.hamcrest.Matchers;
import org.junit.Assert;
import utilities.api.TestData;

import static io.restassured.RestAssured.given;
import static org.junit.Assert.assertEquals;

public class apistepdefinitions_Kevser extends BaseTest {
    TestData testData = new TestData();
    String exceptionMesaj = null;

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

    @Given("The api user prepares a PATCH request containing {int}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string} information to send to the api visitorsUpdate endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_information_to_send_to_the_api_visitors_update_endpoint
            ( int id, String purpose, String name, String email, String contact, String id_proof, String
                    visit_to, String ipd_opd_staff_id, String related_to, String no_of_pepple, String date, String
                      in_time, String out_time, String note){
        map = testData.visitorsUpdateRequestBody(id, purpose, name, email, contact, id_proof, visit_to, ipd_opd_staff_id, related_to, no_of_pepple, date, in_time, out_time, note);
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
}

