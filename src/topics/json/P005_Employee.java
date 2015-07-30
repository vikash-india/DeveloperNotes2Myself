package topics.json;

public class P005_Employee {

    private int id;
    private String name;
    private float salary;

    public P005_Employee(int id, String name, float salary) {
        super();
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
