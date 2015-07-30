package topics.json;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class P013_Employee {

    @SerializedName("employee_id")
    @Expose(serialize = true, deserialize = true)
    private int id;

    @SerializedName("employee_name")
    @Expose(serialize = true, deserialize = false)
    private String name;

    @Expose(serialize = false, deserialize = false)
    private String password;

    @SerializedName("employee_salary")
    @Expose(serialize = false, deserialize = true)
    private float salary;

    public P013_Employee(int id, String name, float salary, String password) {
        this.id = id;
        this.name = name;
        this.salary = salary;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getPassword() {
        return password;
    }

    public float getSalary() {
        return salary;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setSalary(float salary) {
        this.salary = salary;
    }

    @Override
    public String toString() {
        return "P013_Employee [id=" + id + ", name=" + name + ", password=" + password + ", salary=" + salary + "]";
    }
}
