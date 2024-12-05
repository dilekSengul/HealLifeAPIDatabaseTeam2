package base;

import com.github.javafaker.Faker;
import config_Requirements.ConfigLoader;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import org.json.JSONObject;

import java.util.HashMap;

public abstract class BaseTest {

    protected static ConfigLoader configLoader;

    protected static JsonPath repJP;
    public static Response response;
    protected static HashMap map;
    protected static Faker faker;

    protected static JSONObject requestBody;

    public BaseTest() {
        map = new HashMap<>();
        configLoader = new ConfigLoader();
        faker = new Faker(); // Faker nesnesi initialize edildi.
        requestBody = new JSONObject();

    }
}
