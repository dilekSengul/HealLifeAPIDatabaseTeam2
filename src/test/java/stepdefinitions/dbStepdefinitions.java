package stepdefinitions;

import HelperDB.CommonData;
import Manage.Manage;
import io.cucumber.java.en.*;
import org.junit.Assert;
import utilities.db.JDBCMethods;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


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
    private int startingcount;
    JDBCMethods jdbcMethods = new JDBCMethods();
  
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
                case "DB_US07":
                    query = getUS07();
                    statement = getStatement();
                    resultSet = statement.executeQuery(query);
                    break;
                case "DB_US08":
                    query = getUS08();
                    statement = getStatement();
                    resultSet = statement.executeQuery(query);
                    break;
                case "DB_US09":
                    query = getUS09();
                    statement = getStatement();
                    resultSet = statement.executeQuery(query);
                    break;

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
        @Then("User prints the ‘DB_US10’ query response returned")
        public void user_prints_the_db_us10_query_response_returned() throws SQLException {
            while (resultSet.next()) {
                System.out.println(resultSet.getString("child_name"));
            }

        }

        @Given("Query prepared into the patients table")
        public void query_prepared_into_the_patients_table() throws SQLException {
            query=getUS25();
            resultSet=getStatement().executeQuery(query);
        }

        @Given("Verify result is returned")
        public void verify_result_is_returned() throws SQLException {
           CommonData.patientsEmailGender =new HashMap<>();
            while (resultSet.next()) {
                CommonData.patientsEmailGender.put(resultSet.getString("gender"),resultSet.getString("email"));
            }
            if(!CommonData.patientsEmailGender.isEmpty()){
                for (int i = 0; i <CommonData.patientsEmailGender.size() ; i++) {
                    // buraya expected Liste karşılaşması yazılır.
                    System.err.println( CommonData.patientsEmailGender.get(i));
                }
            }else{
                assertFalse("Resultset is EMPTY", resultSet.next());
            }
        }


        @Given("the {string} table exists and is accessible")
        public void the_table_exists_and_is_accessible(String string) {

            try {
                    query= "SHOW TABLES LIKE '" + string + "'";
                    resultSet=getStatement().executeQuery(query);
                if (!resultSet.next()) {
                    throw new RuntimeException("Table " + string + " does not exist or is not accessible.");
                }
            } catch (SQLException e) {
                throw new RuntimeException("Database connection error: " + e.getMessage(), e);
            }
        }

        @When("get the number of records in the nurse_note table and store it as the startingcount")
        public void get_the_number_of_records_in_the_nurse_note_table_and_store_it_as_the_startingcount() {
            try {
                query= "select count(*) from nurse_note";
                resultSet=getStatement().executeQuery(query);
                if (resultSet.next()) {
                    startingcount = resultSet.getInt(1); // 1. sütun, count(*)'yi içerir
                    System.out.println("Starting count: " + startingcount);  // Opsiyonel: Değeri yazdırabilirsiniz
                }
            }
          catch (SQLException e) {
              throw new RuntimeException("Database connection error: " + e.getMessage(), e);
          }
        }

        @When("the following data is inserted into the table:")
        public void the_following_data_is_inserted_into_the_table(io.cucumber.datatable.DataTable dataTable) {
            try {
                List<Map<String, String>> rows = dataTable.asMaps();
                for (Map<String, String> row : rows) {
                    String date = row.get("date");
                    String ipd_id = row.get("ipd_id");
                    String staff_id = row.get("staff_id");
                    String note = row.get("note");
                    String comment = row.get("comment");
                    String updated_at = row.get("updated_at");

                    String query = "INSERT INTO nurse_note (date, ipd_id, staff_id, note, comment, updated_at) " +
                            "VALUES ('" + date + "', " + ipd_id + ", " + staff_id + ", '" + note + "', '" + comment + "', '" + updated_at + "')";
                    System.out.println(query);
                     getStatement().executeUpdate(query);
                }
            } catch (SQLException e) {
                throw new RuntimeException("Error inserting data: " + e.getMessage(), e);
            }
        }


        @Then("there should be more than one records in the {string} table")
        public void there_should_be_more_than_one_records_in_the_table(String string) {
            try {
                String query = "select count(*) from nurse_note";
                resultSet = getStatement().executeQuery(query);

                if (resultSet.next()) {
                    int currentCount = resultSet.getInt(1); // Güncel kayıt sayısı
                    System.out.println("Current count after insert: " + currentCount);

                    // Kayıt sayısını kıyasla
                    if (currentCount > startingcount) {
                        System.out.println("New records have been inserted!");
                    } else {
                        System.out.println("No new records were inserted.");
                    }
                }
            } catch (SQLException e) {
                throw new RuntimeException("Database connection error: " + e.getMessage(), e);
            }
        }


        @Then("the inserted records should match the following data exactly:")
        public void the_inserted_records_should_match_the_following_data_exactly(io.cucumber.datatable.DataTable dataTable) {
            List<Map<String, String>> dataRows = dataTable.asMaps(String.class, String.class);
            try {
                String query = "SELECT * FROM nurse_note";
                resultSet = getStatement().executeQuery(query);

                while (resultSet.next()) {
                    for (Map<String, String> row : dataRows) {
                        boolean matchFound = true;

                        for (String column : row.keySet()) {
                            String expectedValue = row.get(column);
                            String actualValue = resultSet.getString(column);

                            if (actualValue == null || !actualValue.equals(expectedValue)) {
                                matchFound = false;
                                break;
                            }
                        }

                        if (matchFound) {
                            System.out.println("Inserted record matches the expected data.");
                            break;
                        } else {
                            System.out.println("Inserted record does not match the expected data.");
                        }
                    }
                }
            } catch (SQLException e) {
                throw new RuntimeException("Database connection error: " + e.getMessage(), e);
            }
        }

    //-------------------DB_US18--------------------------//
    @When("I execute query the database for {string}")
    public void i_query_the_database_for(String queryId) throws SQLException {
        query = getQuery(queryId);
        resultSet = getStatement().executeQuery(query);
    }

    @Then("the created_at field for each record should be valid")
    public void the_created_at_field_for_each_record_should_be_valid() throws SQLException {
        int resultSize = resultSet.getFetchSize();
        Assert.assertTrue("No data found in database", resultSize > 0);

        while (resultSet.next()) {
            Timestamp createdAt = resultSet.getTimestamp("created_at");
            if (createdAt == null) {
                throw new AssertionError("created_at field is null");
            }
        }
    }



    //-------------------DB_US19--------------------------//
    @When("the result should contain working hours for staff_id {int} on Tuesday")
    public void the_result_should_contain_working_hours_for_staff_id_on_tuesday(Integer int1) throws SQLException {
        List<Integer> workingHoursList = new ArrayList<>();

        while (resultSet.next()) {
            int workingHours = resultSet.getInt("working_hours");
            workingHoursList.add(workingHours);
        }
        // Assert that the result set contains at least one row of working hours
        Assert.assertTrue("No working hours found for staff_id 2 on Tuesday", !workingHoursList.isEmpty());

    }


    //-------------------DB_US20_confirm_deletion--------------------------//
    @When("I execute query the database for {string} with data")
    public void i_execute_query_the_database_for_with_data(String queryId, io.cucumber.datatable.DataTable dataTable) throws SQLException {
        query = getQuery(queryId);
        preparedStatement = getPraperedStatement(query);
        for (Map<String, String> row : dataTable.asMaps()) {
            preparedStatement.setString(1, row.get("event_title"));
            preparedStatement.setString(2, row.get("event_description"));
            preparedStatement.setString(3, row.get("start_date"));
            preparedStatement.setString(4, row.get("end_date"));
            preparedStatement.setString(5, row.get("event_type"));
            preparedStatement.setString(6, row.get("event_color"));
            preparedStatement.setString(7, row.get("event_for"));
            preparedStatement.setInt(8, Integer.parseInt(row.get("role_id")));
            preparedStatement.setString(9, row.get("is_active"));
            preparedStatement.executeUpdate();
        }
    }


    //


    @When("I delete query the database for {string}")
    public void i_delete_query_the_database_for(String queryId) throws SQLException {
        query = getQuery(queryId);
        preparedStatement = getPraperedStatement(query);
        preparedStatement.executeUpdate();

    }

    @Then("I confirm no records found for {string}")
    public void i_confirm_no_records_found_for(String queryId) throws SQLException {
        query = getQuery(queryId);
        preparedStatement = getPraperedStatement(query);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            throw new AssertionError("Record was not deleted.");
        }
    }

    //-------------------DB_US10-------------------\\

    @Then("The user verifies children who are siblings")
    public void the_user_verifies_children_who_are_siblings() throws SQLException {
        jdbcMethods.birthRecordAccess(resultSet);
    }

    //-------------------DB_US11-------------------\\

    @Then("The user validates donor data")
    public void the_user_validates_donor_data() throws SQLException {
        resultSet.next();
        assertEquals(resultSet.getInt("id"),7);
        assertEquals(resultSet.getString("donor_name"), "Maria");
        assertEquals(resultSet.getString("date_of_birth"), "2001-03-02");
        assertEquals(resultSet.getString("gender"), "Female");
        assertEquals(resultSet.getString("father_name"), "Jhonson");
    }

    //-------------------DB_US12-------------------\\

    @Then("The user finds id 17 in the listed blood_donor_cycle table information")
    public void the_user_finds_id_in_the_listed_blood_donor_cycle_table_information() throws SQLException {
        resultSet.next();
        assertEquals(resultSet.getInt("id"),17);
    }


}



