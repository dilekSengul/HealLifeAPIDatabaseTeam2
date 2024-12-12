@E2E
Feature: This feature is a file created for Database User Stories 4,5 ,6.

  Background: Database connectivity established
    Given Database connection established


@us_04
Scenario: DB_US04 In the appointment table on the database, verify that the appointments made for the morning are less than the appointments for the afternoon.
  Given Creates query with "SELECT IF (ogleden_once_sayisi < ogleden_sonra_sayisi, 'true', 'false') AS sonuc FROM ( SELECT (SELECT COUNT(*) FROM appointment WHERE TIME(date) < '12:00:00') AS ogleden_once_sayisi, (SELECT COUNT(*) FROM appointment WHERE TIME(date) >= '12:00:00') AS ogleden_sonra_sayisi) AS counts;"
  * Verify that the appointments made for the morning are less than the appointments for the afternoon
  Given Database closed









  @US_05
  Scenario: DB_US05 In the appointment_payment table through the database, verify that the patient IDs selected as "offline" as the payment type are: (1,2,3,16,17,18,20,21,24,25,31).
    * Creates query with "SELECT appointment_id FROM appointment_payment WHERE payment_type = 'offline';"
    * Verify that the patient IDs below selected as offline as the payment type
      | 1  |
      | 2  |
      | 3  |
      | 16 |
      | 24 |
      | 31 |
    * Database closed









  Scenario: DB_US06 List and verify the contents created in 2023 in the appointment_queue table on the database, which were created in May.
    * Creates query with "SELECT date FROM appointment_queue WHERE YEAR(date) = 2023 AND MONTH(date) = 5;"
    * Verifies that it CONTAINS datas : "date" values : "2023-05" message : "false"
    * Database closed






