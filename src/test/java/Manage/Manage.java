package Manage;

import lombok.Getter;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static HelperDB.JDBC_Structure_Methods.connection;

@Getter
public class Manage {

    private String DB_US10 = "SELECT * FROM birth_report";
    //email_type, smtp_server, smtp_port, smtp_username, smtp_password, ssl_tls, smtp_auth, is_active, created_at
    String US35="Insert Into u201212290_heallifeqa.email_config (email_type, smtp_server, smtp_port, smtp_username, smtp_password, ssl_tls, smtp_auth, is_active, created_at) \n" +
            "Values (?,?,?,?,SHA2(?,256),?,?,?,?)" ;
    String US25="Select gender,email From  u201212290_heallifeqa.patients Where patient_name LIKE '%Jain%';";


    String US07="SELECT * FROM u201212290_heallifeqa.bed WHERE created_at = '2023-05-04 06:41:17'  AND is_active = 'yes';";
     String US08="SELECT name FROM u201212290_heallifeqa.bed WHERE bed_group_id = 4  AND is_active = 'no';";

   // String US09="SELECT COUNT(*) AS baby_count FROM birth_report WHERE weight >= 2.5 ; " ;
   String US09="SELECT COUNT(*) AS baby_count FROM  u201212290_heallifeqa.birth_report WHERE weight >= ?; " ;





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

}