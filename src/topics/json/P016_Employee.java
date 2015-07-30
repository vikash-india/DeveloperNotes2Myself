package topics.json;

import java.util.Arrays;

public class P016_Employee {

    private int id;
    private String name;
    private float salary;
    private String subordinates[];

    public P016_Employee(int id, String name, float salary, String subordinates[]) {
        this.id = id;
        this.name = name;
        this.salary = salary;
        this.subordinates = subordinates;
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

    public String[] getSubordinates() {
        return subordinates;
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

    public void setSubordinates(String[] subordinates) {
        this.subordinates = subordinates;
    }

    @Override
    public String toString() {
        return "P016_Employee [id=" + id + ", name=" + name + ", salary=" + salary + ", subordinates="
                + Arrays.toString(subordinates) + "]";
    }
}
