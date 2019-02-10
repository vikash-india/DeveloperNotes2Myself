package topics.camel;

import org.apache.camel.CamelContext;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.impl.DefaultCamelContext;
import org.apache.log4j.PropertyConfigurator;

public class P004_EnableLog4jLogging {

    public static void main(String[] args) {
        // Relative path to 'java' directory.
        String log4jPropertiesPath = "src/topics/camel/P004_log4j.properties";
        // Load the log4j properties file dynamically.
        PropertyConfigurator.configure(log4jPropertiesPath);

        CamelContext context = new DefaultCamelContext();

        try {
            context.addRoutes(new RouteBuilder() {
                @Override
                public void configure() throws Exception {
                    from("file:/tmp/input?noop=true")
                            .to("file:/tmp/output");
                }
            });

            context.start();

            Thread.sleep(5000);

            context.stop();
        } catch (Exception e) {
            System.out.println("Exception: " + e);
        }
    }
}
