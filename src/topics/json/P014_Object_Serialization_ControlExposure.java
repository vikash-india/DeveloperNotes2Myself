package topics.json;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class P014_Object_Serialization_ControlExposure {

    public static void main(String[] args) {
        P013_Employee employee = new P013_Employee(1, "Dilbert", 100000.0f, "12345");

        // Process Expose Annotation Using GsonBuilder
        GsonBuilder gsonBuilder = new GsonBuilder();
        gsonBuilder.excludeFieldsWithoutExposeAnnotation();
        Gson gson = gsonBuilder.create();
        String json = gson.toJson(employee);

        System.out.println("Object: " + json);
    }
}
