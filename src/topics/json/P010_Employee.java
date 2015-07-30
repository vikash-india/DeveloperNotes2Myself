package topics.json;

import com.google.gson.annotations.SerializedName;

public class P010_Employee {

    @SerializedName("employee_id")
    private int id;

    @SerializedName("employee_name")
    private String name;

    @SerializedName("employee_salary")
    private float salary;

    public P010_Employee(int id, String name, float salary) {
        this.id = id;
        this.name = name;
        this.salary = salary;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
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

    public void setSalary(float salary) {
        this.salary = salary;
    }

    @Override
    public String toString() {
        return "P003_Employee [id=" + id + ", name=" + name + ", salary=" + salary + "]";
    }
}
