package topics.camel;

import org.apache.camel.CamelContext;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.impl.DefaultCamelContext;
import org.apache.log4j.PropertyConfigurator;

public class P020_CamelSSHComponent {

    public static void main(String[] args) {
        // Enable log4J Logging
        String log4jPropertiesPath = "src/topics/camel/P004_log4j.properties";
        PropertyConfigurator.configure(log4jPropertiesPath);

        CamelContext context = new DefaultCamelContext();

        try {
            context.addRoutes(new RouteBuilder() {
                @Override
                public void configure() throws Exception {
                    // SSH URI Syntax: ssh:<user-name>@<server-name-or-ip-address>:<port-number>?certResource=file:/absolute/path/to/ssh-private-key-file&keyType=ssh-rsa&delay=1000&pollCommand=touch abc%0A
                    // Option delay: Use delay=1000 to poll the server for the command every 1 second.
                    // Option pollCommand: Use any command instead of "touch abc".
                    // Use \n at the End: Use %0A at the end to send \n in encoded format to the SSH server
                    from("ssh:dilbert@example.com:22?certResource=file:/absolute/path/to/ssh-private-key&keyType=ssh-rsa&delay=1000&pollCommand=touch abc%0A")
                            .log("Received Message is ${body} and Headers are ${headers}");
                }
            });

            context.start();
            Thread.sleep(5000);
            context.stop();
        } catch (Exception e) {
            System.out.println("Exception : " + e);
        }
    }
}
