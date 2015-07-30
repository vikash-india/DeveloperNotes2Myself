package topics.json;

import com.google.gson.Gson;

public class P006_Object_Serialization {

    public static void main(String[] args) {
        P005_Employee employee = new P005_Employee(1, "Dilbert", 100000.0f);

        Gson gson = new Gson();
        String json = gson.toJson(employee);

        System.out.println("Object: " + json);
    }
}
