package topics.gson;

import com.google.gson.Gson;

/*
 * Note
 * 1. It is perfectly fine (and recommended) to use private fields.
 * 2. There is no need to use any annotations to indicate a field is to be included for serialisation and
 *    deserialization.
 *    All fields in the current class (and from all super classes) are included by default.
 * 3. If a field is marked transient, (by default) it is ignored and not included in the JSON serialisation or
 *    deserialization.
 * 4. This implementation handles nulls correctly.
 * 5. While serialisation, a null field is skipped from the output.
 * 6. While deserialization, a missing entry in JSON results in setting the corresponding field in the object to null.
 * 7. If a field is synthetic, it is ignored and not included in JSON serialisation or deserialization.
 * 8. Fields corresponding to the outer classes in  inner classes, anonymous classes, and local classes are ignored and
 *    not included in serialization or deserialization
 */
public class P012_Object_Deserialiszation_WithCustomNames {

    public static void main(String[] args) {

        String json = "{\"employee_id\":1,\"employee_name\":\"Dilbert\",\"employee_salary\":100000.0}";

        Gson gson = new Gson();
        P010_Employee employee = gson.fromJson(json, P010_Employee.class);

        System.out.println("Employee: " + employee.toString());
    }
}
