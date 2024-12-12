
Feature: This feature is a file created for Database User Stories 18,19,20

  Background:Database connectivity established
    Given Database connection established


  Scenario: Verify created_at for opd_details_id between 11 and 31
    When  I execute query the database for "DB_US18"
    Then the created_at field for each record should be valid

  @E2E
  Scenario: Calculate working hours for staff_id 2 on Tuesday
    When I execute query the database for "DB_US19"
    And the result should contain working hours for staff_id 2 on Tuesday

  @E2E
  Scenario: Delete an inserted event
    When I execute query the database for "DB_US20_insert" with data
      | event_title  | event_description     | start_date          | end_date            | event_type | event_color | event_for | role_id | is_active |
      | Hurrem Event | This is a test event. | 2024-12-10 10:00:00 | 2024-12-10 12:00:00 | Test       | #FF5733     | Public    | 1       | Yes       |
    When I delete query the database for "DB_US20_delete"
    Then I confirm no records found for "DB_US20_confirm_deletion"

