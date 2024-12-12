package HelperDB;

import com.github.javafaker.Faker;
import lombok.Getter;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.HashMap;

@Getter
public class CommonData {
    Faker faker=new Faker();
    public static HashMap<String,String> patientsEmailGender;
    //email_type, smtp_server, smtp_port, smtp_username, smtp_password, ssl_tls, smtp_auth, is_active, created_at
    //smtp.gmail.com  // 587/465
    private String email_type;
    private String stmp_server;
    private String smtp_port;
    private String smtp_username;
    private String smtp_password;
    private String ssl_tls;
    private String smtp_auth;
    private String is_active;
    private Timestamp created_at;

    public CommonData(){
        this.email_type =faker.internet().domainName();
        this.stmp_server="smtp.gmail.com";
        this.smtp_port= "587/465";
        this.smtp_username=faker.internet().emailAddress();
        this.smtp_password=faker.internet().password();
        this.ssl_tls="ssl";
        this.smtp_auth="true";
        this.is_active="yes";
        this.created_at= Timestamp.valueOf(LocalDateTime.now());
    }

}