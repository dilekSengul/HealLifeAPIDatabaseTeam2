@E2E
Feature: 27 28 29

 # @Select, @DB_US27, @onur
Scenario: DB_US27 List the account_title data of the contents with qualification=MS, specialization= Neurology in the staff table through the database by ordering them in alphabetical order.
    * the user executes the "US27" query

  #@Select, @DB_US28, @onur
Scenario: DB_US28 Verify that the oldest vehicle in the vehicles table has driver_name=bayram erguven and driver_licence =b.
    * the user executes the "US28" query
    * Verifies that datas : "driver_name, driver_licence" values : "bayram erguven, b"

  #@Select, @DB_US29, @onur
Scenario: When the vehicles in the vehicles table are listed from oldest to newest according to
    the manufacture_year information and when they are listed from oldest to newest according to
    the created_at information, verify that there is a vehicle in the same index in both lists.
    * the user executes the "US29" query
    * verifies that the table is not empty.