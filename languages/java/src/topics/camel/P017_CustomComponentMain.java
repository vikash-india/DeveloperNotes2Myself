package topics.camel;

import org.apache.camel.CamelContext;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.impl.DefaultCamelContext;
import org.apache.log4j.PropertyConfigurator;

public class P017_CustomComponentMain {

    public static void main(String[] args) {
        // Enable log4J Logging
        String log4jPropertiesPath = "src/topics/camel/P004_log4j.properties";
        PropertyConfigurator.configure(log4jPropertiesPath);

        CamelContext context = new DefaultCamelContext();

        // Register a new component
        context.addComponent("custom", new P017_CustomComponent());
        // Note: Alternatively, copy P017_custom as custom to the directory
        // DeveloperNotes2Myself/languages/java/src/META-INF/services/org/apache/camel/component/custom

        try {
            context.addRoutes(new RouteBuilder() {
                @Override
                public void configure() throws Exception {
                    from("custom://HelloWorld")
                            .to("log:result");
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


