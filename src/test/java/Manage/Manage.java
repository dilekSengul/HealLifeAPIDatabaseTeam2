package Manage;

import lombok.Getter;

@Getter
public class Manage {

    private String DB_US10 = "SELECT * FROM birth_report";
    //email_type, smtp_server, smtp_port, smtp_username, smtp_password, ssl_tls, smtp_auth, is_active, created_at
    String US35="Insert Into u201212290_heallifeqa.email_config (email_type, smtp_server, smtp_port, smtp_username, smtp_password, ssl_tls, smtp_auth, is_active, created_at) \n" +
            "Values (?,?,?,?,SHA2(?,256),?,?,?,?)" ;
    String US25="Select gender,email From  u201212290_heallifeqa.patients Where patient_name LIKE '%Jain%';";


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
}