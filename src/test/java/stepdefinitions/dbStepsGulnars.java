package stepdefinitions;

import Manage.Manage;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.junit.Assert;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import static HelperDB.JDBC_Structure_Methods.*;
import static org.junit.Assert.assertTrue;





public class dbStepsGulnars extends Manage {


    String query;
    public static ResultSet resultset;

    @Given("Creates query with {string}")
    public void creates_query_with(String query) throws SQLException {
        this.query = query;
        resultset = getStatement().executeQuery(query);
    }


    @Given("Verifies that it CONTAINS datas : {string} values : {string} message : {string}")
    public void verifies_that_it_contains_datas_values_message(String actualValueColumn, String expectedValue, String message) throws SQLException {

        // bu stepte CONTAINS asserti yapılıyor, assertEquals icin ayrı method var.

        String[] columnsArr = actualValueColumn.split("#");
        String[] valuesArr = expectedValue.split("#");

        resultset.absolute(0);
        for (int i = 0; i < columnsArr.length; i++) {
            while (resultset.next()) {
                Assert.assertTrue(message, resultset.getString(columnsArr[i]).contains(valuesArr[i]));
            }
        }
    }



    @And("Verify that the appointments made for the morning are less than the appointments for the afternoon")
    public void verifyThatTheAppointmentsMadeForTheMorningAreLessThanTheAppointmentsForTheAfternoon() throws SQLException {
        resultset.absolute(0);
        resultset.next();
        boolean control = resultset.getBoolean(1);

        Assert.assertFalse(control);
    }


    @Given("Verify that the patient IDs below selected as offline as the payment type")
    public void verify_that_the_patient_i_ds_below_selected_as_offline_as_the_payment_type(List<Integer> list) throws SQLException {
        resultset.absolute(0);

        boolean control = true;
        int index = 0;
        while (resultset.next()) {
            int data = resultset.getInt(1);

            if (data != list.get(index)) {
                control = false;
                break;
            }
            index++;
        }
        Assert.assertTrue(control);
    }

}

