package topics.gson;

import com.google.gson.Gson;

public class P002_PrimitiveDataTypes_Deserialization {

    public static void main(String[] args) {
        Gson gson = new Gson();
        String json = null;

        // Deserialize JSON to Boolean
        json = "false";
        Boolean value = gson.fromJson(json, Boolean.class);
        System.out.println("Boolean: " + value);

        // Deserialize JSON to int, Integer, Long
        json = "1";
        int i = gson.fromJson(json, int.class);
        System.out.println("int: " + i);

        Integer j = gson.fromJson(json, Integer.class);
        System.out.println("Integer: " + j);

        Long k = gson.fromJson(json, Long.class);
        System.out.println("Long: " + k);

        // Deserialize JSON to Float
        json = "1.01";
        float f = gson.fromJson(json, float.class);
        System.out.println("int: " + f);

        // Deserialize JSON to String
        json = "abc";
        String str = gson.fromJson(json, String.class);
        System.out.println("String: " + str);
    }
}
