package stepdefinitions;


import Manage.Manage;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import utilities.db.JDBCMethods;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import static HelperDB.JDBC_Structure_Methods.getStatement;


public class dbStepdefinitions_Serpil extends Manage {


        ResultSet resultSet;

    public Manage manage=new Manage();
    JDBCMethods jdbcMethods = new JDBCMethods();
    @When("Query the {string} table for the patient with the earliest {string}")
    public void query_the_table_for_the_patient_with_the_earliest(String string, String string2) {

    }

    @Then("The {string} field of the patient should be {string}")
    public void the_field_of_the_patient_should_be(String string, String string2) {

        try {
            String query = "SELECT  " +  string + ", dob FROM patients " +
                    "WHERE " + string + " = '" + string2 + "' " +
                    "ORDER BY dob ASC " +
                    "LIMIT 1;";
            resultSet = getStatement().executeQuery(query);

            if (resultSet.next()) {
                String currentRec = resultSet.getString(1);
                Date currentdob = resultSet.getDate(2);
                System.out.println("Current record: " + currentRec + "-" + currentdob);


            }
        } catch (SQLException e) {
            throw new RuntimeException("Database connection error: " + e.getMessage(), e);
        }

    }

    }

