package topics.gson;

import com.google.gson.Gson;

public class P001_PrimitiveDataTypes_Serialization {

    public static void main(String[] args) {
        Gson gson = new Gson();
        String json = null;

        // Serialize Boolean to JSON
        json = gson.toJson(true);
        System.out.println("Boolean: " + json); // prints true

        // Serialize Integers to JSON
        json = gson.toJson(1);
        System.out.println("Integer: " + json); // prints 1

        // Serialize Float to JSON
        json = gson.toJson(new Long(10));       // prints 10
        System.out.println("Float: " + json);

        // Serialize String to JSON
        json = gson.toJson("abcd");             // prints "abcd"
        System.out.println("String: " + json);
    }
}
