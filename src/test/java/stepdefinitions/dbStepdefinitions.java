package stepdefinitions;

import HelperDB.CommonData;
import Manage.Manage;
import io.cucumber.java.en.*;

import java.sql.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import static HelperDB.JDBC_Structure_Methods.*;
import static HelperDB.JDBC_Structure_Methods.query;
import static org.junit.Assert.assertFalse;

public class dbStepdefinitions extends Manage {
    CommonData data = new CommonData();
    Statement statement;
    ResultSet resultSet;
    ResultSetMetaData metaData;
    private int startingcount;

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




        }







