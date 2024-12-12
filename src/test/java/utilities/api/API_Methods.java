package utilities.api;

import base.BaseTest;
import io.restassured.http.ContentType;
import io.restassured.response.Response;

import java.util.Arrays;

import static hooks.api.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.equalTo;

public class
API_Methods extends BaseTest {
    public static String fullPath;

    public static void pathParam(String rawPaths) { // /api/opdList
        String[] paths = rawPaths.split("/");  // [api, opdList]

        System.out.println(Arrays.toString(paths));

        StringBuilder tempPath = new StringBuilder("/{");


        for (int i = 0; i < paths.length; i++) {

            String key = "pp" + i;
            String value = paths[i].trim();

            spec.pathParam(key, value);

            tempPath.append(key + "}/{");

        }
        tempPath.deleteCharAt(tempPath.lastIndexOf("/"));
        tempPath.deleteCharAt(tempPath.lastIndexOf("{"));

        fullPath = tempPath.toString();
        System.out.println("fullPath = " + fullPath);
    }

    public static Response sendRequest(String httpMethod, Object requestBody) {

        switch (httpMethod.toUpperCase()) {
            case "GET":
                if (requestBody != null) {
                    response = given()
                            .spec(spec)
                            .contentType(ContentType.JSON)
                            .when()
                            .body(requestBody)
                            .get(fullPath);
                } else {
                    response = given()
                            .spec(spec)
                            .when()
                            .get(fullPath);
                }
                break;
            case "POST":
                response = given()
                        .spec(spec)
                        .contentType(ContentType.JSON)
                        .when()
                        .body(requestBody)
                        .post(fullPath);
                break;
            case "PATCH":
                response = given()
                        .spec(spec)
                        .contentType(ContentType.JSON)
                        .when()
                        .body(requestBody)
                        .patch(fullPath);
                break;
            case "DELETE":
                response = given()
                        .spec(spec)
                        .contentType(ContentType.JSON)
                        .when()
                        .body(requestBody)
                        .delete(fullPath);
                break;
        }

        if (response != null) {
            response.prettyPrint();
        }

        return response;
    }


    public static String tryCatchRequest(String httpMethod, Object requestBody) {
        String exceptionMesaj = null;
        try {
            switch (httpMethod.toUpperCase()) {
                case "GET":
                    if (requestBody != null) {
                        response = given()
                                .spec(spec)
                                .contentType(ContentType.JSON)
                                .when()
                                .body(requestBody)
                                .get(fullPath);
                    } else {
                        response = given()
                                .spec(spec)
                                .when()
                                .get(fullPath);
                    }
                    break;
                case "DELETE":
                    response = given()
                            .spec(spec)
                            .contentType(ContentType.JSON)
                            .when()
                            .body(requestBody)
                            .delete(fullPath);
                    break;
                case "PATCH":
                    response = given()
                            .spec(spec)
                            .contentType(ContentType.JSON)
                            .when()
                            .body(requestBody)
                            .patch(fullPath);
                    break;
            }
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }
        System.out.println("Exception Mesaj : " + exceptionMesaj);
        return exceptionMesaj;
    }

    public static void statusCodeAssert(int statusCode) {
        response.then()
                .assertThat()
                .statusCode(statusCode);
    }

    public static void assertBody(String path, String value) {
        response.then()
                .assertThat()
                .body(path, equalTo(value));
    }

}
