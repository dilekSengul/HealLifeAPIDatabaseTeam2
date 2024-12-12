@E2E
Feature:This feature is a file created for Database User Stories 24, 25, 26

  Background: Database connectivity established
    Given Database connection established


  Scenario: Verifying gender and email information for patients with 'Jain' in their names
    When Query prepared into the patients table
    Then Verify result is returned
    And Database closed


  Scenario: Nurse can insert multiple notes into the nurse_note table
    Given the "nurse_note" table exists and is accessible
    When get the number of records in the nurse_note table and store it as the startingcount
    When the following data is inserted into the table:

      | date                | ipd_id | staff_id | note             | comment        | updated_at          |
      | 2024-12-11 16:34:13 | 35     | 961      | Tansiyon ölçüldü | Sabah kontrolü | 2024-12-11 16:34:13 |

    Then there should be more than one records in the "nurse_note" table
    And the inserted records should match the following data exactly:

      | date                | ipd_id | staff_id | note             | comment        | updated_at          |
      | 2024-12-11 16:34:13 | 35     | 961      | Tansiyon ölçüldü | Sabah kontrolü | 2024-12-11 16:34:13 |

    And Database closed

  @US26
  Scenario: Validate the known allergies of the oldest patient in the database
    When Query the "patients" table for the patient with the earliest "dob"
    Then The "known_allergies" field of the patient should be "Fast food"

