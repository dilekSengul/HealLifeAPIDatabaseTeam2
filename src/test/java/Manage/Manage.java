package Manage;

import lombok.Getter;

@Getter
public class Manage {

    private String DB_US10 = "SELECT * FROM birth_report";
    //email_type, smtp_server, smtp_port, smtp_username, smtp_password, ssl_tls, smtp_auth, is_active, created_at
    String US35="Insert Into u201212290_heallifeqa.email_config (email_type, smtp_server, smtp_port, smtp_username, smtp_password, ssl_tls, smtp_auth, is_active, created_at) \n" +
            "Values (?,?,?,?,SHA2(?,256),?,?,?,?)" ;
    String US25="Select gender,email From  u201212290_heallifeqa.patients Where patient_name LIKE '%Jain%';";

    private String US_30 = "SELECT name FROM visitors_book WHERE related_to = 'Maria Fernandis (4) (OPDN24)' AND purpose = 'Visit';";

    private String US_31 = "SELECT cons_doctor, COUNT(*) AS instruction FROM consultant_register GROUP BYcons_doctor;";

    private String US_32 = "SELECT * FROM consultant_register WHERE date >= '2024-11-18 00:00:00' AND date < '2024-12-01 00:00:00';";




    //***************Getter***************\\


    public String getDB_US10() {
        return DB_US10;
    }

    public String getUS35() {
        return US35;
    }

    public String getUS25() {
        return US25;
    }

    public String getUS_30() {return US_30;}

    public String getUS_31() {return US_31;}

    public String getUS_32() {return US_32;}
}