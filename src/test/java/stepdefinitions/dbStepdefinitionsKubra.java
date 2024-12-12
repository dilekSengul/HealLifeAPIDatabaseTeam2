package stepdefinitions;

import HelperDB.CommonData;
import Manage.Manage;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.junit.Assert;

import java.sql.*;

import static HelperDB.JDBC_Structure_Methods.*;
import static org.junit.Assert.*;

public class dbStepdefinitionsKubra extends Manage {
    CommonData data = new CommonData();
    Statement statement;
    ResultSet resultSet;
    ResultSetMetaData metaData;
    public int babyCount;
    public Manage manage=new Manage();


    @Given("User verifies that count babies with weight greater than or equal to {double} kg")
    public void userVerifiesThatCountBabiesWithWeightGreaterThanOrEqualToKg(double weight) throws SQLException {
        babyCount = manage.getBabyCountByWeight(weight);
    }

    @When("the count of babies should be {int}")
    public void theCountOfBabiesShouldBe(int expectedCount) throws SQLException {
        assertEquals(expectedCount, babyCount);
        System.out.println("Test passed: Baby count is " + babyCount);


    }

    @Then("The bed record should be active")
    public void theBedRecordShouldBeActive() {
        try {
            if (resultSet.next()) {
                String isActive = resultSet.getString("is_active");
                assertEquals("yes", isActive);
            } else {
                throw new RuntimeException("No active bed found with the specified created_at.");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @When("User query the bed with created_at '2023-05-04 06:41:17'")
    public void ıQueryTheBedRecordWithCreated_at() throws SQLException {
      statement=connection.createStatement();
      resultSet=statement.executeQuery(manage.getUS07());
    }


    @Then("Verify the name is null")
    public void verifyTheNameIsNull() {
        try {
            String bedName = null;
            if (resultSet != null && resultSet.next()) {
                bedName = resultSet.getString("name");
            }
            assertTrue("Bed name should be null", bedName == null);
            System.out.println("Bed name is null as expected.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }



}
