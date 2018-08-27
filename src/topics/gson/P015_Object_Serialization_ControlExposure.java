package topics.gson;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class P015_Object_Serialization_ControlExposure {

    public static void main(String[] args) {
        String json = "{\"employee_id\":1,\"employee_name\":\"Dilbert\",\"employee_salary\":100000.0}";

        // Process Expose Annotation Using GsonBuilder
        GsonBuilder gsonBuilder = new GsonBuilder();
        gsonBuilder.excludeFieldsWithoutExposeAnnotation();
        Gson gson = gsonBuilder.create();
        P013_Employee employee = gson.fromJson(json, P013_Employee.class);

        System.out.println("Object: " + employee);
    }
}
