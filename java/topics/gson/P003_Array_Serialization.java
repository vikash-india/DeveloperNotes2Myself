package topics.gson;

import com.google.gson.Gson;

/*
 * Note
 * 1. Multi-dimensional arrays, with arbitrarily complex element types are also supported.
 */
public class P003_Array_Serialization {

    public static void main(String[] args) {
        Gson gson = new Gson();

        // Integer Array to JSON
        int[] ints = {1, 2, 3, 4, 5};
        String json =  gson.toJson(ints);               // prints [1,2,3,4,5]
        System.out.println("Integer Array: " + json);

        // String Array to JSON
        String[] strings = {"abc", "def", "ghi"};
        json =  gson.toJson(strings);                   // prints ["abc","def","ghi"]
        System.out.println("String Array: " + json);
    }
}
