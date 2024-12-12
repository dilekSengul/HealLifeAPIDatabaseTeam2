Feature: This feature is a file created for Database User Stories 07,08 ,09

  Background:
    Given Database connection established
@db
  Scenario: DB_US07 Verify that the bed with created_at =  '2023-05-04 06:41:17' is active in the bed table.
    Given User creates Query for "DB_US07"
    When User query the bed record with created_at "2023-05-04 06:41:17"
    Then The bed record should be active
    Then Database closed

  @db
  Scenario: Verify the patient's name with bed_group_id = 4 and is_active = "no" in the bed table
    Given User creates Query for "DB_US08"
    Then Verify the name is null
    Then Database closed


  @db
  Scenario: Verify the number of babies with a weight of 2.5 kg or higher in the birth_report table.
    Given User creates Query for "DB_US09"
    When User verifies that count babies with weight greater than or equal to 2.5 kg
    Then the count of babies should be 3
    Then Database closed



