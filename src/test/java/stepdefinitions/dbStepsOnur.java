package stepdefinitions;

import Manage.Manage;
import io.cucumber.java.en.Given;
import org.junit.jupiter.api.Assertions;

import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;


import java.sql.*;

import static org.junit.Assert.assertEquals;
import static utilities.db.JDBCMethods.executeSelectQueryOnur;

public class dbStepsOnur extends Manage {

    ResultSet resultSet;



    @Given("the user executes the {string} query")
    public void runQuery(String queryKey) throws Exception {

        resultSet = executeSelectQueryOnur(queryKey);

        //ilk sütun bilgisini döner
        while (resultSet.next()) {
            System.out.println("Result: " + resultSet.getString(1));
        }
        resultSet.beforeFirst(); //sonraki step için resultseti resetler

    }

    //column-row veri test expected/actual veri doğrulama
    @Given("Verifies that datas : {string} values : {string}")
    public void verifiesThatDatasValues(String columns, String expectedValues) {
        try {
            // resultSet boş ya da null değilse,
            // column ve expectedValue'lar için birer adet String.split ile ayrılmış array oluşturur.
            // for içerisinde her bir elemanı String olarak tek tek test eder.
            if (resultSet != null && resultSet.next()) {
                String[] columnArray = columns.split(",");
                String[] valueArray = expectedValues.split(",");
                for (int i = 0; i < columnArray.length; i++) {
                    String column = columnArray[i].trim();
                    String expectedValue = valueArray[i].trim();
                    String actualValue = resultSet.getString(column);
                    System.out.println("Verifying column: " + column + " | Expected: " + expectedValue + " | Actual: " + actualValue);
                    assertEquals(expectedValue, actualValue);
                }
            } else {
                System.out.println("ResultSet is empty or null.");
                // resultSet boş ya da null ise bilgi verir

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }


    @Given("verifies that the table is not empty.")
    public void verifiesThatTheTableIsNotEmpty() throws SQLException {

            // ResultSet dolu mu değil mi kontrol eder
        if (resultSet.next()) {
                System.out.println("The query returned results.");
                Assertions.assertTrue(true, "The result set is not empty.");
            } else {
                System.out.println("The query returned no results.");
                Assertions.fail("The result set is empty.");
            }

        }


























    @Given("consultant_register, ipd_details, and staff tables")
    public void consultant_registerIpd_detailsAndStaffTables() {
        
    }

    @When("the user queries combined data")
    public void theUserQueriesCombinedData() {
        
    }

    @Then("return IPD records with doctor names")
    public void returnIPDRecordsWithDoctorNames() {
        
    }

    @Given("the death_report table contains names and dates of death")
    public void theDeath_reportTableContainsNamesAndDatesOfDeath() {
        
    }

    @When("the user queries deaths from the last {int} days")
    public void theUserQueriesDeathsFromTheLastDays(int arg0) {
        
    }

    @Then("return names \\(or relatives) and dates of death")
    public void returnNamesOrRelativesAndDatesOfDeath() {
        
    }

    @Given("the email_config table exists")
    public void theEmail_configTableExists() {
        
    }

    @When("the user adds a new entry with a passcode encrypted using the SHA{int} method")
    public void theUserAddsANewEntryWithAPasscodeEncryptedUsingTheSHAMethod(int arg0) {
        
    }

    @Then("the table should store the passcode securely")
    public void theTableShouldStoreThePasscodeSecurely() {
    }



}


