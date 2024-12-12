package stepdefinitions;

import Manage.Manage;
import io.cucumber.java.en.Given;

import java.sql.*;

import static org.junit.Assert.assertEquals;
import static utilities.db.JDBCMethods.executeSelectQueryOnur;

public class dbStepsOnur extends Manage {

    ResultSet resultSet;

    @Given("the user executes the {string} query")
    public void runQuery(String queryKey) throws Exception {

        resultSet = executeSelectQueryOnur(queryKey);

        while (resultSet.next()) {
            System.out.println("Result: " + resultSet.getString(1));
        }
        resultSet.beforeFirst();

    }

    @Given("Verifies that datas : {string} values : {string}")
    public void verifiesThatDatasValues(String columns, String expectedValues) {
        try {
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
                // ResultSet boş veya null ise bilgi ver

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

}


