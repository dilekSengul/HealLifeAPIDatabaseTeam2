Feature: This feature is a file created for Database User Stories 07,08 ,09

  Background:
    Given Database connection established



  Scenario: Verify the patient's name with bed_group_id = 4 and is_active = "no" in the bed table
    Given User creates Query for "DB_US08"
    When User verifies that no patient name is returned
    Then Database closed

  Scenario: DB_US07 Verify that the bed with created_at =  '2023-05-04 06:41:17' is active in the bed table.
    Given User creates Query for "DB_US07"
    When User verifies that the data with created_at "2023-05-04 06:41:17" is active "yes"
    Then Database closed

  Scenario: Verify the number of babies with a weight of 2.5 kg or higher in the birth_report table.
    Given User creates Query for "DB_US09"
    When User verifies that count babies with weight greater than or equal to 2.5 kg
    Then the count of babies should be 3
    Then Database closed


  #  * Database connection is closed
