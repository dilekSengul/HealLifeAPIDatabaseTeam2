package Manage;

import lombok.Getter;

import java.util.Map;

@Getter
public class Manage {

    private String DB_US10 = "SELECT * FROM birth_report";
    //email_type, smtp_server, smtp_port, smtp_username, smtp_password, ssl_tls, smtp_auth, is_active, created_at
    String US35 = "Insert Into u201212290_heallifeqa.email_config (email_type, smtp_server, smtp_port, smtp_username, smtp_password, ssl_tls, smtp_auth, is_active, created_at) \n" +
            "Values (?,?,?,?,SHA2(?,256),?,?,?,?)";
    String US25 = "Select gender,email From  u201212290_heallifeqa.patients Where patient_name LIKE '%Jain%';";

    Map<String, String> queryMap = Map.of(
        "DB_US18", "SELECT created_at FROM u201212290_heallifeqa.discharge_card WHERE opd_details_id > 11 AND opd_details_id < 31;",
        "DB_US19", "SELECT TIMESTAMPDIFF(HOUR, start_time, end_time) AS working_hours FROM doctor_shift WHERE staff_id = 2 AND day = 'Tuesday';",
        "DB_US20_insert", "INSERT INTO u201212290_heallifeqa.events (event_title, event_description, start_date, end_date, event_type, event_color, event_for, role_id, is_active) VALUES (?,?,?,?,?,?,?,?,?);",
        "DB_US20_delete", "DELETE FROM events WHERE id = (SELECT MAX(id) FROM events);",
        "DB_US20_confirm_deletion", "SELECT * FROM events WHERE event_title = 'Insert Ayse Event';"
    );

    //***************Getter***************\\


    public String getDB_US10() {
        return DB_US10;
    }

    public String getUS35() {
        return US35;
    }

    public String getUS25() {
        return US25; }

    public String getQuery(String queryId) {
        return queryMap.get(queryId);
    }
}