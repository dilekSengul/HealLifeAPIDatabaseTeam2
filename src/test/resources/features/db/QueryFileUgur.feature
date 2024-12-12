@E2E
Feature: This feature is a file created for Database User Stories 33, 34, 35

 # @select @US33 @ugur
  Scenario: Combining consultant_register with ipd_details and staff tables, list the IPD records and doctor names of the instructions.(consultant_register)

    * Database connection established
    * the user executes the "US33" query
    * consultant_register, ipd_details, and staff tables
    * the user queries combined data
    * return IPD records with doctor names
    * Database closed

  #@US34 @ugur
  Scenario: List the names (or names of relatives) and dates of death of people who have died in the last week according to the date of death in the death_report table.

    * Database connection established
    * the user executes the "US34" query
    * the death_report table contains names and dates of death
    * the user queries deaths from the last 7 days
    * return names (or relatives) and dates of death
    * Database closed

  #@US35 @ugur
  Scenario: Add 1 data to the email_config table whose passcode is protected with sha2 method.

    * Database connection established
    * the user executes the "US35" query
    * the email_config table exists
    * the user adds a new entry with a passcode encrypted using the SHA2 method
    * the table should store the passcode securely
    * Database closed