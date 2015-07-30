package topics.json;

import java.util.ArrayList;
import com.google.gson.Gson;

public class P008_Collection_Serialization {

    public static void main(String[] args) {

        // Create objects
        P005_Employee employee1 = new P005_Employee(1, "Dilbert", 100000.0f);
        P005_Employee employee2 = new P005_Employee(2, "Dogbert", 200000.0f);
        P005_Employee employee3 = new P005_Employee(3, "Catbert", 300000.0f);

        // Create ArrayList
        ArrayList<P005_Employee> employees = new ArrayList<P005_Employee>();
        employees.add(employee1);
        employees.add(employee2);
        employees.add(employee3);

        // Collections to JSON
        Gson gson = new Gson();
        String json = gson.toJson(employees);

        System.out.println("Array: " + json);
    }
}
