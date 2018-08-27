package topics.gson;

import java.util.Arrays;

import com.google.gson.Gson;

public class P004_Array_Deserialization {

    public static void main(String[] args) {
        Gson gson = new Gson();

        // JSON to Integer Array
        String json = "[1,2,3,4,5]";
        int[] ints = gson.fromJson(json, int[].class);
        System.out.println("Array: " + Arrays.toString(ints));

        // JSON to String Array
        json = "[\"abc\",\"def\",\"ghi\"]";
        String[] strings = gson.fromJson(json, String[].class);
        System.out.println("Array: " + Arrays.toString(strings));
    }
}
