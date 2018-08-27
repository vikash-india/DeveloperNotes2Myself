package topics.gson;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class P018_Object_Deserialization_PrettyPrinting {

    public static void main(String[] args) {

        String json = "{" +
        "\"id\": 1," +
        "\"name\": \"Dilbert\"," +
        "\"salary\": 100000.0," +
        "\"subordinates\": [" +
          "\"Dogbert\"," +
          "\"Catbert\"" +
        "]" +
      "}";

        // Note: There is not need to use setPrettyPrinting() while deserializing.
        GsonBuilder gsonBuilder = new GsonBuilder();
        Gson gson = gsonBuilder.create();
        P016_Employee employee = gson.fromJson(json, P016_Employee.class);

        System.out.println("Object: " + employee.toString());
    }
}
