package utilities.api;

import base.BaseTest;
import io.restassured.builder.RequestSpecBuilder;
import io.restassured.http.ContentType;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import org.json.JSONObject;

import static hooks.api.HooksAPI.spec;
import static io.restassured.RestAssured.given;

public class Authentication extends BaseTest {
    public static String generateToken() {

        JSONObject reqBody = null;

        spec = new RequestSpecBuilder().setBaseUri(configLoader.getApiConfig("base_url")).build();

        spec.pathParams("pp1", "api", "pp2", "getToken");
        reqBody = new JSONObject();
        reqBody.put("email", configLoader.getApiConfig("adminEmail"));
        reqBody.put("password", configLoader.getApiConfig("adminPassword"));

        Response response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .header("Accept", "application/json")
                .when()
                .body(reqBody.toString())
                .post("/{pp1}/{pp2}");


        JsonPath repJP = response.jsonPath();

        String token = repJP.getString("token");

        System.out.println("Token : " + token);
        return token;
    }
}
