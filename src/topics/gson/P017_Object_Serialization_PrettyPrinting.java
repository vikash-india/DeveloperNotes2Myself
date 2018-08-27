package topics.gson;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class P017_Object_Serialization_PrettyPrinting {

    public static void main(String[] args) {
        String[] subordinates = {"Dogbert", "Catbert"};
        P016_Employee employee = new P016_Employee(1, "Dilbert", 100000.0f, subordinates);

        // Use setPrettyPrinting
        GsonBuilder gsonBuilder = new GsonBuilder().setPrettyPrinting();
        Gson gson = gsonBuilder.create();
        String json = gson.toJson(employee);

        System.out.println("Object: " + json);
    }
}
