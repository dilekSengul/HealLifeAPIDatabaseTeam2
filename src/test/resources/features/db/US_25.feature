Feature:

  Background: Database connectivity established
    * Database connection established

  @US25
  Scenario: data control into the patients table
    * Query prepared into the patients table
    * Verify result is returned
    * Database closed