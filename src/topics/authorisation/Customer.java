package topics.authorisation;

public class Customer {

    int customerId;
    String customerName;
    String version;

    public Customer(int customerId, String customerName, String version) {
        this.customerId = customerId;
        this.customerName = customerName;
        this.version = version;
    }

    public int getCustomerId() {
        return customerId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public String getVersion() {
        return version;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    @Override
    public String toString() {
        return "Customer [customerId=" + customerId + ", customerName=" + customerName
                + ", version=" + version + "]";
    }
}
