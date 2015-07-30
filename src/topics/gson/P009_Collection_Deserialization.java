package topics.gson;

import java.lang.reflect.Type;
import java.util.Collection;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

/*
 * Note
 * 1. Collection Limitations
 *      - Can serialize collection of arbitrary objects but can not deserialize from it. This is because there is no
 *        way for the user to indicate the type of the resulting object.
 *      - While deserializing, Collection must be of a specific generic type.
 */
public class P009_Collection_Deserialization {

    public static void main(String[] args) {

        String json = "[{\"id\":1,\"name\":\"Dilbert\",\"salary\":100000.0},{\"id\":2,\"name\":\"Dogbert\",\"salary\"" +
                ":200000.0},{\"id\":3,\"name\":\"Catbert\",\"salary\":300000.0}]";

        // Fairly hideous way of defining the type of collection. Unfortunately, no way to get around this in Java
        Gson gson = new Gson();
        Type collectionType = new TypeToken<Collection<P005_Employee>>(){}.getType();
        Collection<P005_Employee> employees = gson.fromJson(json, collectionType);

        for (P005_Employee employee: employees) {
            System.out.println("Employee: " + employee.toString());
        }
    }
}
