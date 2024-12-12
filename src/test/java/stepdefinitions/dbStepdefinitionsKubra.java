package stepdefinitions;

import HelperDB.CommonData;
import Manage.Manage;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

import java.sql.*;

import static HelperDB.JDBC_Structure_Methods.connection;
import static HelperDB.JDBC_Structure_Methods.preparedStatement;
import static org.junit.Assert.*;

public class dbStepdefinitionsKubra extends Manage {
    CommonData data = new CommonData();
    Statement statement;
    ResultSet resultSet;
    ResultSetMetaData metaData;
    public int babyCount;
    public Manage manage=new Manage();
    String bedName;

    @When("User verifies that count babies with weight greater than or equal to {double} kg")
    public void userVerifiesThatCountBabiesWithWeightGreaterThanOrEqualToKg(double weight) throws SQLException {
        babyCount = manage.getBabyCountByWeight(weight);
    }

    @Then("the count of babies should be {int}")
    public void theCountOfBabiesShouldBe(int expectedCount) throws SQLException {
        assertEquals(expectedCount, babyCount);
        System.out.println("Test passed: Baby count is " + babyCount);


    }

    @Then("The bed record should be active")
    public void theBedRecordShouldBeActive() {
        try {
            boolean recordExists = resultSet.next();
            assertEquals("The bed record is not active!", true, recordExists);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @When("User query the bed record with created_at {string}")
    public void ıQueryTheBedRecordWithCreated_at(String createdAt) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(manage.getUS07());
            preparedStatement.setString(1, createdAt);
            resultSet = preparedStatement.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
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
