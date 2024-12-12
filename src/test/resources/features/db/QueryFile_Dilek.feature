
#Feature:
#@US   #21
#Scenario: List the IDs of the X-RAY laboratories from the laboratories in the lab table. Verify that the largest of the ids is (3) by the database.
#* User sets the database connection
#* Creates query with "SELECT max(id) AS max_id FROM heallife_hospitaltraining.lab WHERE lab_name LIKE '%X-RAY%';"
#* Verify that max id is three
#* Database connection is closed
#@US  #22
#Scenario:  Verify that the language information of the data whose short_code is "yi" in the languages table is "Yiddish" through the database.
#* User sets the database connection
#* Creates query with "SELECT language FROM heallife_hospitaltraining.languages where short_code='yi';"
#* Verifies that datas : "language" values : "Yiddish" message : "false"
#* Database connection is closed
#@US  #23
#Scenario: DB_Check that the other information of the data whose address information is "Andheri, Mumbai" in the medicine_supplier table on the database is correct.
#* User sets the database connection
#* Creates query with "SELECT * FROM heallife_hospitaltraining.medicine_supplier where address='Andheri, Mumbai'; "
#* Verifies that datas : "address" values : "Andheri, Mumbai" message : "false"
#* Database connection is closed