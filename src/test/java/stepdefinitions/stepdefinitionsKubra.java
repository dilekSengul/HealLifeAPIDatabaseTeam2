package stepdefinitions;

import base.BaseTest;
import io.cucumber.java.en.Then;
import org.hamcrest.Matchers;

public class stepdefinitionsKubra extends BaseTest {
    @Then("The api user verifies the information in the response body for the entry with the specified {int} index, including {string} ve {string},{string},{string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_ve_and(Integer dataIndex, String type, String slug, String url, String title, String date) {
        response.then()
                .assertThat()
                .body("lists[" + dataIndex + "].type", Matchers.equalTo(type),
                        "lists[" + dataIndex + "].slug", Matchers.equalTo(slug),
                        "lists[" + dataIndex + "].url", Matchers.nullValue(),//.body("lists.url", Matchers.nullValue())
                        "lists[" + dataIndex + "].title", Matchers.equalTo(title),
                        "lists[" + dataIndex + "].date", Matchers.equalTo(date));

}
