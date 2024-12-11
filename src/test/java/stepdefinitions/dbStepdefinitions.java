package stepdefinitions;

import HelperDB.CommonData;
import Manage.Manage;
import io.cucumber.java.en.*;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import static HelperDB.JDBC_Structure_Methods.*;

public class dbStepdefinitions extends Manage {
    CommonData data = new CommonData();
    Statement statement;
    ResultSet resultSet;
    ResultSetMetaData metaData;

    @Given("Database connection established")
    public void database_connection_established() {
        createConnection();
    }

    @Given("Database closed")
    public void database_closed() {
        closeConnection();
    }

    @When("User creates Query for {string}")
    public void user_creates_query_for(String us) {
        try {
            switch (us) {
                case "DB_US10":
                    query = getDB_US10();
                    statement = getStatement();
                    resultSet = statement.executeQuery(query);
                    break;

            }
        } catch (Exception e) {
            System.out.println("You entered the US name incorrectly or not at all");
        }

    }

    @Then("User prints the ‘DB_US10’ query response returned")
    public void user_prints_the_db_us10_query_response_returned() throws SQLException {
        while (resultSet.next()) {
            System.out.println(resultSet.getString("child_name"));
        }
    }

    //
}
