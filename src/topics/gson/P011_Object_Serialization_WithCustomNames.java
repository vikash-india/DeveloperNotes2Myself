package topics.gson;

import com.google.gson.Gson;

public class P011_Object_Serialization_WithCustomNames {

    public static void main(String[] args) {
        P010_Employee employee = new P010_Employee(1, "Dilbert", 100000.0f);

        Gson gson = new Gson();
        String json = gson.toJson(employee);

        System.out.println("Object: " + json);
    }
}
