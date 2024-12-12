package hooks.db;

import HelperDB.JDBC_Structure_Methods;
import base.BaseTest;
import config_Requirements.ConfigLoader;
import io.cucumber.java.After;
import io.cucumber.java.Before;


public class HooksDB extends BaseTest {

    static { configLoader = new ConfigLoader();}

    @Before()
    public static void createConnection() {
    JDBC_Structure_Methods.createConnection();
    }

    @After()
    public static void closeConnection() {
    JDBC_Structure_Methods.closeConnection();
    }

}
