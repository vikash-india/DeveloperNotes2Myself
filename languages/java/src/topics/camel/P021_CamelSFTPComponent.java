package topics.camel;

import org.apache.camel.CamelContext;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.impl.DefaultCamelContext;
import org.apache.log4j.PropertyConfigurator;

public class P021_CamelSFTPComponent {

    public static void main(String[] args) {
        // Enable log4J Logging
        String log4jPropertiesPath = "src/topics/camel/P004_log4j.properties";
        PropertyConfigurator.configure(log4jPropertiesPath);

        CamelContext context = new DefaultCamelContext();

        try {
            context.addRoutes(new RouteBuilder() {
                @Override
                public void configure() throws Exception {
                    // 1. General Syntax: sftp:<ssh-user-name>@<server-name-or-ip-address>:<ssh-port>/<relative-path-to-user-home-directory>/?preferredAuthentications=publickey&privateKeyFile=<absolute-path-to-ssh-private-key>&knownHostsFile=<absolute-path-to-known_hosts-file>
                    // 2. Use SFTP in 'to' clause to send files to remote server
                    from("file:/tmp/input?noop=true")
                            // Enable Camel Logging
                            .to("log:?level=INFO&showBody=true&showHeaders=true")
                            .to("sftp:dilbert@<server-name-or-ip-address>:22/<relative-path-to-user-home-directory>/?preferredAuthentications=publickey&privateKeyFile=<absolute-path-to-ssh-private-key>&knownHostsFile=<absolute-path-to-known_hosts-file>")
                            .log("Received Message is ${body} and Headers are ${headers}");

                    // 3. Use SFTP in 'from' clause to get files from the remote server
                    from("sftp:sftp:dilbert@<server-name-or-ip-address>:22/<relative-path-to-user-home-directory>/?preferredAuthentications=publickey&privateKeyFile=<absolute-path-to-ssh-private-key>&knownHostsFile=<absolute-path-to-known_hosts-file>")
                            .log("Received Message is ${body} and Headers are ${headers}")
                            .to("file:/tmp/output");
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
