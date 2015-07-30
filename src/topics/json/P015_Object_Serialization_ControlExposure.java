package topics.json;

import com.google.gson.Gson;

public class P015_Object_Serialization_ControlExposure {

    public static void main(String[] args) {
        P010_Employee employee = new P010_Employee(1, "Dilbert", 100000.0f);

        Gson gson = new Gson();
        String json = gson.toJson(employee);

        System.out.println("Object: " + json);
    }
}
