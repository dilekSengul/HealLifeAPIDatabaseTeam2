package Manage;

import lombok.Getter;

import java.util.HashMap;
import java.util.Map;

@Getter
public class Manage {

    private String DB_US10 = "SELECT * FROM birth_report";
    //email_type, smtp_server, smtp_port, smtp_username, smtp_password, ssl_tls, smtp_auth, is_active, created_at
    String US35 = "Insert Into u201212290_heallifeqa.email_config (email_type, smtp_server, smtp_port, smtp_username, smtp_password, ssl_tls, smtp_auth, is_active, created_at) \n" +
            "Values (?,?,?,?,SHA2(?,256),?,?,?,?)";
    String US25 = "Select gender,email From  u201212290_heallifeqa.patients Where patient_name LIKE '%Jain%';";

    //***************Getter***************\\


    public String getDB_US10() {
        return DB_US10;
    }

    public String getUS35() {
        return US35;
    }

    public String getUS25() {
        return US25; }






    /*****************Ortak step içinde string ile query çağırma*****************/
        private static final Map<String, String> queries = new HashMap<>();

        static {
                queries.put("US27", "SELECT account_title FROM staff WHERE qualification='MS' AND specialization='Neurology' ORDER BY account_title ASC;");
                queries.put("US28", "SELECT * FROM vehicles WHERE driver_name = 'bayram erguven' AND driver_licence = 'b' ORDER BY manufacture_year ASC LIMIT 1;");
        }

        public static String getQueryOnur(String key) {
            return queries.getOrDefault(key, "QUERY_NOT_FOUND");
        }
    /* ************************************************************************* */



}