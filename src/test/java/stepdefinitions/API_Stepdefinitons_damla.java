package stepdefinitions;

import base.BaseTest;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.hamcrest.Matchers;
import org.junit.Assert;
import utilities.API_Utilities.TestData;

public class API_Stepdefinitons_damla extends BaseTest {

    TestData testData = new TestData();
    String exceptionMesaj = null;

    @Then("The api user verifies the information in the response body for the entry with the specified {int} index, including {string}, {string}, {string}, {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int dataIndex, String type, String slug, String url, String title, String date) {

        repJP = response.jsonPath();

        Assert.assertEquals(type,repJP.getString("lists[" + dataIndex + "].type"));
        Assert.assertEquals(slug,repJP.getString("lists[" + dataIndex + "].slug"));
        Assert.assertEquals(url,repJP.getString("lists[" + dataIndex + "].url"));
        Assert.assertEquals(title,repJP.getString("lists[" + dataIndex + "].title"));
        Assert.assertEquals(date,repJP.getString("lists[" + dataIndex + "].date"));
    }
    @Then("The api user prepares a GET request containing the {int} information to send to the api getNoticeById endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_information_to_send_to_the_api_get_notice_by_ıd_endpoint(int id) {
        requestBody.put("id", id);

        System.out.println("Get Body : "+ requestBody);

    }
    @When("The api user verifies that the data in the response body includes {string}, {string}, {string}, {string}, {string} and {string}.")
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

}
