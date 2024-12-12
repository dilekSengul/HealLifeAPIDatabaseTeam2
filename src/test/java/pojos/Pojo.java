package pojos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Time;

//@Data
//@NoArgsConstructor
//@AllArgsConstructor
public class Pojo {

    /*
            "type": "deneme",
            "title": " hi",
            "description": "canim",
            "slug": "hi"
     */

    private String type;
    private String title;
    private String description;
    private String slug;

    // Yapıcı Metot
    public Pojo(String type, String title, String description, String slug) {
        this.type = type;
        this.title = title;
        this.description = description;
        this.slug = slug;
    }

    // Getter ve Setter Metotları
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSlug() {
        return slug;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }
    private String name;
    private String isBloodGroup;

    private String purpose;
    private String email;
    private String contact;
    private String id_proof;


}
