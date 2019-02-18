package topics.camel;

// This has to be a public class
public class P019_DataObject {
    private String name;
    private String developer;

    public P019_DataObject(String name, String developer) {
        this.name = name;
        this.developer = developer;
    }

    public String getName() {
        return name;
    }

    public String getDeveloper() {
        return developer;
    }
}