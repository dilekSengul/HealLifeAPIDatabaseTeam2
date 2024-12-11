package utilities.api;

import base.BaseTest;

import java.util.HashMap;

public class TestData extends BaseTest {

    public HashMap visitorsPurposeUpdateRequestBody(int id, String visitors_purpose, String description) {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("id", id);
        requestBody.put("visitors_purpose", visitors_purpose);
        requestBody.put("description", description);

        return requestBody;
    }

    public HashMap noticeUpdateRequestBody(Integer id, String type, String title, String description, String slug) {
        HashMap<String, Object> requestBody = new HashMap<>();
        requestBody.put("id", id);
        requestBody.put("type", type);
        requestBody.put("title", title);
        requestBody.put("description", description);
        requestBody.put("slug", slug);

        return requestBody;
    }

    public HashMap expenseHeadUpdateRequestBody(Integer id, String exp_category, String description) {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("id", id);
        requestBody.put("exp_category", exp_category);
        requestBody.put("description", description);

        return requestBody;
    }

    //gulnar
    public HashMap noticeUpdateRequestBody(int id, String name, int isBloodGroup, int createdAt) {
        HashMap<String, Object> requestBody = new HashMap<>();
        requestBody.put("id", id);
        requestBody.put("name", name);
        requestBody.put("isBloodGroup", isBloodGroup);
        requestBody.put("time", createdAt);


        return requestBody;
    }

    //dilek
    public HashMap bloodUpdateRequestBody(Integer id, String name, String is_blood_group) {
        HashMap<String, Object> requestBody = new HashMap<>();
        requestBody.put("id", id);
        requestBody.put("name", name);
        requestBody.put("is_blood_group", is_blood_group);
        return requestBody;
    }


    // arzu
    public HashMap visitorsUpdateRequestBody(int id, String purpose, String email, String contact, String id_proof, String visit_to, String ipd_opd_staff_id, String date, String in_time, String out_time) {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("id", id);
        requestBody.put("purpose", purpose);
        requestBody.put("email", email);
        requestBody.put("contact", contact);
        requestBody.put("id_proof", id_proof);
        requestBody.put("visit_to", visit_to);
        requestBody.put("ipd_opd_staff_id", ipd_opd_staff_id);
        requestBody.put("date", date);
        requestBody.put("in_time", in_time);
        requestBody.put("out_time", out_time);
        return requestBody;
    }
        public HashMap findingCategoryUpdateRequestBody ( int id, String category, String created_at){

            HashMap<String, Object> requestBody = new HashMap<>();

            requestBody.put("id", id);
            requestBody.put("category", category);
            requestBody.put("created_at", created_at);


        return requestBody;
    }


    public HashMap visitorsUpdateRequestBody(int id, String purpose, String name, String email, String contact, String id_proof, String visit_to, String ipd_opd_staff_id, String related_to, String no_of_pepple, String date, String in_time, String out_time, String note) {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("id", id);
        requestBody.put("purpose", purpose);
        requestBody.put("name", name);
        requestBody.put("email", email);
        requestBody.put("contact", contact);
        requestBody.put("id_proof", id_proof);
        requestBody.put("visit_to", visit_to);
        requestBody.put("ipd_opd_staff_id", ipd_opd_staff_id);
        requestBody.put("related_to", related_to);
        requestBody.put("no_of_pepple", no_of_pepple);
        requestBody.put("date", date);
        requestBody.put("in_time", in_time);
        requestBody.put("out_time", out_time);
        requestBody.put("note", note);

        return requestBody;
    }

}

