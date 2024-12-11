package stepdefinitions;

import HelperDB.CommonData;
import Manage.Manage;
import io.cucumber.java.en.*;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import static HelperDB.JDBC_Structure_Methods.*;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;

public class dbStepdefinitions extends Manage {
    CommonData data = new CommonData();
    Statement statement;
    ResultSet resultSet;
    ResultSetMetaData metaData;
    public int babyCount;
    public Manage manage=new Manage();

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
                case "DB_US07":
                    query=getUS07();
                    statement=getStatement();
                    resultSet=statement.executeQuery(query);
                    break;
                case "DB_US08":
                    query=getUS08();
                    statement=getStatement();
                    resultSet=statement.executeQuery(query);
                    break;
                case "DB_US09":
                    query=getUS09();
                    statement=getStatement();
                    resultSet=statement.executeQuery(query);
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

    @When("User verifies that the data with created_at {string} is active {string}")
    public void userVerifiesThatTheDataWithCreated_atIsActive(String expectedCreatedAt, String expectedIsActive) throws SQLException {
        if (resultSet.next()) {
            String createdAt = resultSet.getString("created_at");
            String isActive = resultSet.getString("is_active");

            assertEquals(expectedCreatedAt, createdAt);
            assertEquals(expectedIsActive, isActive);
        } else {
            throw new AssertionError("Query kriteriyle eslesen bir veri bulunamadi");
        }
    }

    @When("User verifies that no patient name is returned")
    public void userVerifiesThatNoPatientNameIsReturned() {
        try {
            assertFalse("Veri döndü, ancak boş olması gerekiyordu.", resultSet.next());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    

    @When("User verifies that count babies with weight greater than or equal to {double} kg")
    public void userVerifiesThatCountBabiesWithWeightGreaterThanOrEqualToKg(double weight) throws SQLException {
        babyCount = manage.getBabyCountByWeight(weight);
    }

    @Then("the count of babies should be {int}")
    public void theCountOfBabiesShouldBe(int expectedCount) throws SQLException {
        assertEquals(expectedCount, babyCount);
        System.out.println("Test passed: Baby count is " + babyCount);


    }
}
