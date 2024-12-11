Feature: This feature is a file created for Database User Stories 10,11 12

  Background:
    Given Database connection established

  Scenario: DB_US10: List and verify the names of babies who are siblings in the birth_report table.
    When User creates Query for "DB_US10"
    Then User prints the ‘DB_US10’ query response returned
    And Database closed

  Scenario: DB_US11: Verify that the blood donor with id = 7 has donor_name = Maria, date_of_birth = '2001-03-02', gender = Female, father_name = Jhonson, address = England in the blood_donor table.

  Scenario: DB_US12: List the id numbers of blood_donor_cycle entries where the institution is known, and verify that id = 17 is in the list.