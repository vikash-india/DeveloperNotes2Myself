package topics.camel;

import org.apache.camel.CamelContext;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.impl.DefaultCamelContext;
import org.apache.log4j.PropertyConfigurator;

public class P005_EnableCamelLogging {

    public static void main(String[] args) {
        // Enable log4J Logging
        String log4jPropertiesPath = "src/topics/camel/P004_log4j.properties";
        PropertyConfigurator.configure(log4jPropertiesPath);

        CamelContext context = new DefaultCamelContext();

        try {
            context.addRoutes(new RouteBuilder() {
                @Override
                public void configure() throws Exception {
                    from("file:/tmp/input?noop=true")
                            // Enable Camel Logging
                            .to("log:?level=INFO&showBody=true&showHeaders=true")
                            // .log("Received Message is ${body} and Headers are ${headers}")
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
