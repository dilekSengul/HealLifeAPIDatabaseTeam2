package Manage;

import lombok.Getter;


import java.util.HashMap;
import java.util.Map;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import static HelperDB.JDBC_Structure_Methods.connection;



@Getter
public class Manage {

    //email_type, smtp_server, smtp_port, smtp_username, smtp_password, ssl_tls, smtp_auth, is_active, created_at
    String US35 = "Insert Into u201212290_heallifeqa.email_config (email_type, smtp_server, smtp_port, smtp_username, smtp_password, ssl_tls, smtp_auth, is_active, created_at) \n" +
            "Values (?,?,?,?,SHA2(?,256),?,?,?,?)";
    String US25 = "Select gender,email From  u201212290_heallifeqa.patients Where patient_name LIKE '%Jain%';";


    String US07="SELECT * FROM u201212290_heallifeqa.bed WHERE created_at = '2023-05-04 06:41:17' AND is_active = 'yes';";
    String US08="SELECT name FROM u201212290_heallifeqa.bed WHERE bed_group_id = 4  AND is_active = 'no';";
  //  String US09="SELECT child_name  FROM u201212290_heallifeqa.birth_report WHERE weight >= 2.5;";
    String US09="SELECT COUNT(*) AS baby_count FROM u201212290_heallifeqa.birth_report WHERE weight >= ?";



    Map<String, String> queryMap = Map.of(
        "DB_US18", "SELECT created_at FROM u201212290_heallifeqa.discharge_card WHERE opd_details_id > 11 AND opd_details_id < 31;",
        "DB_US19", "SELECT TIMESTAMPDIFF(HOUR, start_time, end_time) AS working_hours FROM doctor_shift WHERE staff_id = 2 AND day = 'Tuesday';",
        "DB_US20_insert", "INSERT INTO u201212290_heallifeqa.events (event_title, event_description, start_date, end_date, event_type, event_color, event_for, role_id, is_active) VALUES (?,?,?,?,?,?,?,?,?);",
        "DB_US20_delete", "DELETE FROM events WHERE id = (SELECT MAX(id) FROM events);",
        "DB_US10","SELECT child_name, case_reference_id FROM birth_report WHERE case_reference_id IN (SELECT case_reference_id FROM birth_report GROUP BY case_reference_id HAVING COUNT(*) > 1);",
        "DB_US11","SELECT id, donor_name, date_of_birth, gender, father_name, address FROM blood_donor WHERE id = 7;",
        "DB_US12","SELECT * FROM blood_donor_cycle WHERE institution IS NOT NULL AND id = 17;",
        "DB_US20_confirm_deletion", "SELECT * FROM events WHERE event_title = 'Hurrem Event';"

    );

    //***************Getter***************\\



    public String getUS35() {
        return US35;
    }

    public String getUS25() {
        return US25; }

    public String getQuery(String queryId) {
        return queryMap.get(queryId);
    }
    public String getUS07() {
        return US07;
    }
    public String getUS08() {
        return US08;
    }

    public String getUS09() {
        return US09;
    }

    public int getBabyCountByWeight(double weight) throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement(US09);
        preparedStatement.setDouble(1, weight);

        ResultSet resultSet = preparedStatement.executeQuery();
        int babyCount = 0;

        if (resultSet.next()) {
            babyCount = resultSet.getInt("baby_count");
        }

        return babyCount;
    }





    /*****************ONUR - Ortak step içinde string ile query çağırma*****************/
        private static final Map<String, String> queries = new HashMap<>();

        static {
                queries.put("US27", "SELECT account_title FROM staff WHERE qualification='MS' AND specialization='Neurology' ORDER BY account_title ASC;");
                queries.put("US28", "SELECT * FROM vehicles WHERE driver_name = 'bayram erguven' AND driver_licence = 'b' ORDER BY manufacture_year ASC LIMIT 1;");
                queries.put("US29", "SELECT *FROM (SELECT *,ROW_NUMBER() OVER (ORDER BY manufacture_year) AS year_row_num,ROW_NUMBER() OVER (ORDER BY created_at) AS created_row_num FROM vehicles) AS subquery WHERE year_row_num = created_row_num;");
                queries.put("US33", "SELECT account_title FROM staff WHERE qualification='MS' AND specialization='Neurology' ORDER BY account_title ASC;");
                queries.put("US34", "SELECT account_title FROM staff WHERE qualification='MS' AND specialization='Neurology' ORDER BY account_title ASC;");
                queries.put("US35", "SELECT account_title FROM staff WHERE qualification='MS' AND specialization='Neurology' ORDER BY account_title ASC;");

        }

        public static String getQueryOnur(String key) {
            return queries.getOrDefault(key, "QUERY_NOT_FOUND");
        }
    /* ************************************************************************* */



}