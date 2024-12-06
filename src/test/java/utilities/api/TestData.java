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
    public HashMap noticeUpdateRequestBody(Integer id, String type, String title, String description, String slug){
        HashMap<String,Object> requestBody=new HashMap<>();
        requestBody.put("id",id);
        requestBody.put("type",type);
        requestBody.put("title",title);
        requestBody.put("description",description);
        requestBody.put("slug",slug);

        return requestBody;
    }

}
